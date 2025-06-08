{
  pkgs,
  inputs,
  ...
}: {
  nix = {
    package = pkgs.unstable.nix;
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      unstable.flake = inputs.unstable;
      home.flake = inputs.home;
      nur.flake = inputs.nur;
    };
    nixPath = [
      "nixpkgs=/etc/channels/nixpkgs"
      "home-manager=/etc/channels/home-manager"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
    settings.experimental-features = ["nix-command" "flakes"];
  };

  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  environment.etc."channels/home-manager".source = inputs.home.outPath;
}
