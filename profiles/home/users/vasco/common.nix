{
  lib,
  pkgs,
  ...
}: let
  installedPackages = with pkgs; [
    alacritty
    brave
    calibre
    cmake
    diff-so-fancy
    dogdns
    evince
    feh
    gcc
    git-ignore
    gnumake
    helvum
    htop
    jellyfin-media-player
    jetbrains.idea-ultimate
    libtool
    libvterm
    lutris
    neofetch
    okular
    pavucontrol
    protonmail-bridge
    qalculate-gtk
    remmina
    showmethekey
    slack
    sonixd
    spotify
    thunderbird
    tldr
    transmission-gtk
    transmission-remote-gtk
    unstable.joshuto
    unstable.vlc
    unstable.webcord
    unstable.wineWowPackages.waylandFull
    waypipe
    winetricks
    wl-clipboard
    zoom-us
  ];
in {
  home.packages = installedPackages;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit configDir;
    };
  };

  home-manager.users."vasco" = {
    pkgs,
    configDir,
    ...
  }: {
    imports = with profiles.home.users.vasco; [
      dconf
      streaming
      ssh
      fzf
      foot
      kitty
      gtk
      zsh
      neovim
      git
      tmux
      firefox
      direnv
    ];
    home = {
      username = "vasco";
      homeDirectory = "/home/vasco";
      stateVersion = "22.05";
    };

    systemd.user.services.protonmail-bridge = {
      Unit.Description = "Proton Mail Bridge server";
      Install.WantedBy = ["graphical-session.target"];
      Service.ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge -n";
    };

    programs.home-manager.enable = true;
    home.packages = installedPackages;
    home.file.".ideavimrc" = {
      enable = true;
      text = builtins.readFile "${configDir}/nvim/init.vim";
    };
  };
}
