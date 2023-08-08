# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "usbhid" ];
  boot.kernelModules = [
    "kvm-amd"
  ];
  boot.kernelParams = [
    "quiet"
  ];
  boot.extraModulePackages = [
    config.boot.zfs.package.latestCompatibleLinuxPackages.amdgpu-pro
  ];
  boot.plymouth = {
    enable = true;
    themePackages = [ (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "splash" ]; }) ];
    theme = "splash";
  };
  boot.initrd.systemd.enable = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.allowHibernation = true;
  boot.zfs.forceImportRoot = false;
  boot.zfs.forceImportAll = false;
  services.zfs.autoScrub.enable = true;
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r zroot/enc/root@blank
  '';

  fileSystems."/" =
    {
      device = "zroot/enc/root";
      fsType = "zfs";
      options = [ "zfsutil" ];
      neededForBoot = true;
    };

  fileSystems."/home" =
    {
      device = "zroot/enc/home";
      fsType = "zfs";
      options = [ "zfsutil" ];
      neededForBoot = true;
    };

  fileSystems."/nix" =
    {
      device = "zroot/enc/nix";
      fsType = "zfs";
      options = [ "zfsutil" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-label/swap"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0f0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}