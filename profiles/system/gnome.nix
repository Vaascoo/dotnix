{pkgs, ...}: let
  gnomeApps = with pkgs.unstable; [
    gnome-system-monitor
    gnome-screenshot
    networkmanager-openvpn
    gnome-tweaks
    dconf-editor
  ];

  extensions = with pkgs.unstable.gnomeExtensions; [
    tray-icons-reloaded
    appindicator
    tiling-assistant
    sound-output-device-chooser
    blur-my-shell
    vitals
    pop-shell
    dash-to-dock
  ];
in {
  environment.systemPackages = with pkgs;
    [
      pinentry-gnome3
      pop-launcher
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
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
}
