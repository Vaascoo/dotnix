{
  lib,
  pkgs,
  ...
}: {
  boot.bootspec.enable = true;

  environment.systemPackages = with pkgs; [sbctl];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/nix/persist/etc/secureboot";
    settings.editor = null;
  };
}
