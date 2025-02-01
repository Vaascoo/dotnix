{
  configDir,
  pkgs,
  profiles,
  ...
}: {
  imports = with profiles.system; [
    acme
    age
    common
    disable_suspend
    doh
    fonts
    gitea
    gnome
    hwAccel
    k3s
    keymap
    media
    pipewire
    ssh
    sshKeys
    tailscale
    virt
    wayland
    zfs
  ];

  networking.hostId = "5e8c59c3";

  networking.firewall.enable = false;

  security.pki.certificateFiles = ["${configDir}/certificates/ist.crt" "${configDir}/certificates/rnl.crt" "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"];

  boot.supportedFilesystems = ["ntfs" "zfs"];
  boot.binfmt.emulatedSystems = ["armv6l-linux"];

  powerManagement.enable = false;
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  programs.steam = {
    enable = true;
  };

  system.stateVersion = "22.05";
}
