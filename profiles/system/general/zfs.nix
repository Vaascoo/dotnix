{ config, pkgs, ... }:

{
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/secureboot"
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/lib"
      "/var/log"
      "/etc/ssh"
      "/etc/secrets"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
