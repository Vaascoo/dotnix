{pkgs, ...}: let
  gnomeApps = with pkgs; [
    gnome-system-monitor
    gnome-screenshot
    networkmanager-openvpn
    gnome-tweaks
    dconf-editor
    albert
  ];

  extensions = with pkgs.gnomeExtensions; [
    tray-icons-reloaded
    appindicator
    tiling-assistant
    vitals
    dash-to-dock
    tiling-shell
  ];
in {
  environment.systemPackages = with pkgs;
    [
      pinentry-gnome3
    ]
    ++ gnomeApps
    ++ extensions;

  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    autoSuspend = false;
    wayland = true;
  };
  services.udev.packages = with pkgs; [gnome-settings-daemon];
}
