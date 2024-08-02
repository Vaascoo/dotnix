{
  pkgs,
  inputs,
  lib,
  ...
}: {
  nix = {
    package = pkgs.unstable.nix;
    # registry.nixpkgs.flake = lib.mkForce inputs.unstable;
    # registry.nixpkgs2405.flake = lib.mkForce inputs.nixpkgs;
    # registry.home-manager.flake = lib.mkForce inputs.home;
    nixPath = [
      "nixpkgs=/etc/channels/nixpkgs"
      "nixpkgs2405=/etc/channels/nixpkgs2405"
      "home-manager=/etc/channels/home-manager"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = ["nix-command" "flakes"];
  };

  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = lib.mkForce "1";
  environment.etc."channels/nixpkgs".source = inputs.unstable.outPath;
  environment.etc."channels/nixpkgs2405".source = inputs.nixpkgs.outPath;
  environment.etc."channels/home-manager".source = inputs.home.outPath;
}
