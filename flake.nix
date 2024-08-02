{
  description = "My NixOs hosts, Home-Manager configurations and some dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    latest.url = "github:NixOS/nixpkgs/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence/master";
    flake-utils.url = "github:numtide/flake-utils";
    nixd = {
      url = "github:nix-community/nixd/refs/tags/1.2.3";
    };
    home = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote?ref=v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {...}: let
    inherit (inputs.nixpkgs) lib;
    inherit (inputs.home.nixosModules) home-manager;
    inherit (inputs.impermanence.nixosModules) impermanence;
    inherit (inputs.lanzaboote.nixosModules) lanzaboote;
    inherit (inputs.agenix.nixosModules) age;

    _overlays = arch: [
      (final: prev: {
        unstable = mkPkgs inputs.unstable arch (arch: []);
        latest = mkPkgs inputs.latest arch (arch: []);
      })
      (import ./overlays/default.nix {
        inherit lib;
        pkgDir = ./packages;
      })
      inputs.nur.overlay
      inputs.agenix.overlays.default
    ];

    mkPkgs = pkgs: arch: userOverlays:
      import pkgs {
        system = arch;
        config.allowUnfree = true;
        config.hardware.enableAllFirmware = true;
        overlays = userOverlays arch;
      };

    mkShells = dir: {};

    importRecursive = dir: let
      entries = lib.filesystem.listFilesRecursive dir;
    in
      if (builtins.pathExists dir)
      then
        builtins.map
        (entry: (import entry))
        (builtins.filter (entry: lib.hasSuffix ".nix" entry) entries)
      else [];

    mkProfiles = dir: let
      mkLevel = entry: type:
        if (lib.hasSuffix ".nix" entry && type == "regular")
        then (import "${dir}/${entry}")
        else if type == "directory"
        then mkProfiles "${dir}/${entry}"
        else {};
      doMagic = key: value:
        lib.attrsets.nameValuePair
        (lib.removeSuffix ".nix" key)
        (mkLevel key value);
    in
      lib.attrsets.mapAttrs' doMagic (builtins.readDir dir);

    _modules = importRecursive ./modules;

    _profiles = mkProfiles ./profiles;

    mkHost = {
      name,
      arch,
      dir,
    }:
      lib.nixosSystem {
        system = arch;
        pkgs = mkPkgs inputs.nixpkgs arch _overlays;
        specialArgs = {
          inherit inputs;
          profiles = _profiles;
          configDir = ./config;
        };
        modules =
          [
            {networking.hostName = name;} # timezone missing, don't forget
            home-manager
            impermanence
            age
            lanzaboote
          ]
          ++ (importRecursive dir)
          ++ _modules;
      };

    mkHosts = dir: let
      filterHosts = hosts: lib.attrsets.filterAttrs (key: value: value == "directory") hosts;
      getArch = host: let
        archFile = "${dir}/${host}/arch";
      in
        if builtins.pathExists archFile
        then builtins.readFile archFile
        else "x86_64-linux";
    in
      lib.attrsets.mapAttrs
      (entry: type:
        mkHost {
          name = entry;
          arch = getArch entry;
          dir = "${dir}/${entry}";
        })
      (filterHosts (builtins.readDir dir));
  in {
    nixosConfigurations = mkHosts ./hosts;
    devShells = mkShells ./shells;
    # TODO change this to be system agnostic
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
