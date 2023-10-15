{ pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.unstable.nix;
    registry.nixpkgs.flake = inputs.unstable;
    registry.nixpkgs2305.flake = inputs.nixpkgs;
    registry.home-manager.flake = inputs.home;
    nixPath = [
      "nixpkgs=/etc/channels/nixpkgs"
      "nixpkgs2305=/etc/channels/nixpkgs2305"
      "home-manager=/etc/channels/home-manager"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  environment.etc."channels/nixpkgs".source = inputs.unstable.outPath;
  environment.etc."channels/nixpkgs2305".source = inputs.nixpkgs.outPath;
  environment.etc."channels/home-manager".source = inputs.home.outPath;
}
