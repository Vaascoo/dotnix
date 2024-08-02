{
  config,
  lib,
  pkgs,
  configDir,
  home,
  ...
}: {
  services.xserver = {
    enable = true;
    layout = "pt";
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    displayManager = {
      lightdm = {
        enable = true;
        background = "${configDir}/ign_bratislava.png";
        greeters.mini = {
          enable = true;
          user = "vasco";
        };
      };
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        hacksaw
        libinput-gestures
        shotgun
        xclip
        i3status
        autotiling
        dmenu
        betterlockscreen
        dunst
        xfce.thunar
        blueberry
        networkmanagerapplet
        arandr
        brightnessctl
        playerctl
        pulseaudio
      ];
      package = pkgs.i3-gaps;
      configFile = "${configDir}/i3/config";
    };
  };

  security.pam.services.i3lock = {
    text = ''
      auth include login
    '';
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.picom.enable = true;
  location = {
    latitude = 38.736946;
    longitude = -9.142685;
  };
  services.redshift.enable = true;
  systemd.user.services."dunst" = {
    enable = true;
    description = "";
    wantedBy = ["default.target"];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst";
  };
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
