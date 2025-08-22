{
  inputs,
  configDir,
  profilesDir,
  modulesDir,
  homesDir,
  lib,
  ...
}: let
  inherit (inputs.home.lib) homeManagerConfiguration;
  inherit (inputs.home.nixosModules) home-manager;
  inherit (inputs.impermanence.nixosModules) impermanence;
  inherit (inputs.lanzaboote.nixosModules) lanzaboote;
  inherit (inputs.agenix.nixosModules) age;

  forEachSystem = fn: let
    systems = ["aarch64-darwin" "x86_64-linux"];
  in
    builtins.listToAttrs (builtins.map (system: {
        name = system;
        value = fn system;
      })
      systems);

  mkPkgs = pkgs: system: overlays:
    import pkgs {
      inherit overlays system;
      config = {
        allowUnfree = true;
        hardware.enableAllFirmware = true;
      };
    };

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
    entries = builtins.readDir dir;

    importEntry = name: type:
      if type == "regular" && lib.hasSuffix ".nix" name
      then import (dir + "/${name}")
      else if type == "directory"
      then mkProfiles (dir + "/${name}")
      else {};

    mkAttr = name: type:
      lib.nameValuePair (lib.removeSuffix ".nix" name) (importEntry name type);
  in
    lib.mapAttrs' mkAttr entries;

  mkHomes = dir: pkgs: let
    entries = builtins.readDir dir;
    subdirs = lib.filterAttrs (_: type: type == "directory") entries;
    withHome = lib.filterAttrs (name: _: builtins.pathExists (dir + "/${name}/home.nix")) subdirs;
  in
    lib.mapAttrs
    (name: _:
      import (dir + "/${name}/home.nix") {
        inherit lib pkgs;
        profiles = mkProfiles (dir + "/${name}/profiles");
      })
    withHome;

  mkLinuxHost = hostDir: name: let
    system = "x86_64-linux";
    hostModules = importRecursive "${hostDir}/${name}";
    commonModules = importRecursive "${modulesDir}";
    profiles = mkProfiles "${profilesDir}";
    pkgs = mkPkgs inputs.nixpkgs system (mkOverlays system);
    homes = mkHomes "${homesDir}" pkgs;
  in
    lib.nixosSystem {
      inherit system pkgs;
      specialArgs = {inherit configDir homesDir inputs profiles;};
      modules =
        [
          {networking.hostName = name;}
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit configDir;
              };
              users = homes;
            };
          }
          home-manager
          impermanence
          age
          lanzaboote
        ]
        ++ hostModules
        ++ commonModules;
    };

  builder = hostDir: builder: let
    hostList = dirEntries: lib.attrsets.filterAttrs (_: value: value == "directory") dirEntries;
  in
    lib.attrsets.mapAttrs (name: _: (builder hostDir name)) (hostList (builtins.readDir hostDir));

  mkOverlays = system: [
    (final: prev: {
      unstable = mkPkgs inputs.unstable system [];
      latest = mkPkgs inputs.latest system [];
      inherit lib;
    })
    inputs.nur.overlays.default
    inputs.agenix.overlays.default
  ];

  mkHomeManager = homeDir: userName: let
    modules = importRecursive "${homeDir}/${userName}/modules";
    profiles = mkProfiles "${homeDir}/${userName}/profiles";
    entryPoint = let
      homeFile = homeDir + "/${userName}/home.nix";
    in
      if (builtins.pathExists homeFile)
      then (import homeFile)
      else {};
  in
    forEachSystem (system:
      homeManagerConfiguration {
        pkgs = mkPkgs inputs.nixpkgs system (mkOverlays system);
        modules = modules ++ [entryPoint];
        extraSpecialArgs = {inherit configDir inputs profiles;};
      });
in {
  inherit forEachSystem builder importRecursive mkLinuxHost mkPkgs mkProfiles mkHomeManager mkHomes;
}
