{
  lib,
  inputs,
  configDir,
  profilesDir,
  modulesDir,
  ...
}: let
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

  mkLinuxHost = hostDir: name: let
    system = "x86_64-linux";
    hostModules = lib.vasco.importRecursive "${hostDir}/${name}";
    commonModules = importRecursive "${modulesDir}";
    profiles = mkProfiles "${profilesDir}";
    overlays = [
      (final: prev: {
        unstable = lib.vasco.mkPkgs inputs.unstable system [];
        latest = lib.vasco.mkPkgs inputs.latest system [];
      })
      inputs.nur.overlays.default
      inputs.agenix.overlays.default
    ];
  in
    lib.nixosSystem {
      inherit system;
      pkgs = mkPkgs inputs.nixpkgs system overlays;
      specialArgs = {inherit configDir inputs profiles;};
      modules =
        [
          {networking.hostName = name;}
          home-manager
          impermanence
          age
          lanzaboote
        ]
        ++ hostModules
        ++ commonModules;
    };

  mkHosts = hostDir: builder: let
    hostList = dirEntries: lib.attrsets.filterAttrs (_: value: value == "directory") dirEntries;
  in
    lib.attrsets.mapAttrs (name: _: (builder hostDir name)) (hostList (builtins.readDir hostDir));
in {
  inherit forEachSystem importRecursive mkLinuxHost mkHosts mkPkgs mkProfiles;
}
