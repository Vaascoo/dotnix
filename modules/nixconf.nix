{ pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.unstable.nix;
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [
      "nixpkgs=/etc/channels/nixpkgs"
      "unstable=/etc/channels/unstable"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  environment.etc."channels/unstable".source = inputs.unstable.outPath;
}
