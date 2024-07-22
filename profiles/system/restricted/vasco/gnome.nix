{pkgs, ...}: let
  gnomeApps = with pkgs.unstable; [
    gnome-system-monitor
    gnome-screenshot
    networkmanager-openvpn
    # gnome-shell-extensions
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
    # (pop-shell.overrideAttrs {
    #   version = "unstable-2023-11-10";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "pop-os";
    #     repo = "shell";
    #     rev = "aafc9458a47a68c396933c637de00421f5198a2a";
    #     hash = "sha256-74lZbEYHj7fufRSbuI2SN9rqbB3gpRa0V96qjAFc01s=";
    #   };
    #   patches = [ ./gjs.patch ];
    # })
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
