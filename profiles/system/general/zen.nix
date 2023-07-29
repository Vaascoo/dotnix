{ lib, pkgs, ... }:
{
  boot.kernelPackages = pkgs.unstable.linuxPackages_zen;
}
