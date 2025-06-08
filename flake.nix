{
  description = "My NixOs hosts, Home-Manager configurations and some dev shells";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    latest.url = "github:NixOS/nixpkgs/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence/master";
    nixd = {
      url = "github:nix-community/nixd/refs/tags/2.6.0";
    };
    home = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote?ref=v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {...}: let
    lib = inputs.nixpkgs.lib.extend (final: prev: {
      vasco = import ./lib {
        inherit inputs;
        configDir = ./config;
        profilesDir = ./profiles;
        modulesDir = ./modules;
        lib = final;
      };
    });
  in {
    nixosConfigurations = lib.vasco.mkHosts ./hosts lib.vasco.mkLinuxHost;
    formatter = lib.vasco.forEachSystem (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);
  };
}
