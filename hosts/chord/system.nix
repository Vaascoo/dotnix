{
  configDir,
  pkgs,
  profiles,
  ...
}: {
  imports = with profiles.system; [
    age
    common
    doh
    fingerprint
    fonts
    gc
    gnome
    hwAccel
    keymap
    pipewire
    secureboot
    tailscale
    virt
    wayland
    zfs
  ];

  networking.firewall.enable = false;

  security.pki.certificateFiles = ["${configDir}/certificates/ist.crt" "${configDir}/certificates/rnl.crt" "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"];

  boot.supportedFilesystems = ["ntfs" "zfs"];
  boot.binfmt.emulatedSystems = ["armv6l-linux"];

  networking.hostId = "5e8c59c3";

  services.pcscd.enable = true;

  system.stateVersion = "22.05";
}
