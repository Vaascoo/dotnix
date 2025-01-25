{
  pkgs,
  profiles,
  configDir,
  ...
}: let
  installedPackages = with pkgs; [
    ghostty
    okular
    remmina
    protonmail-bridge
    diff-so-fancy
    helvum
    evince
    unstable.webcord
    unstable.vlc
    spotify
    zoom-us
    calibre
    thunderbird
    neofetch
    pavucontrol
    feh
    alacritty
    dogdns
    qalculate-gtk
    unstable.joshuto
    transmission_4-gtk
    git-ignore
    jellyfin-media-player
    sonixd
    slack
    tldr
    showmethekey
    brave
    htop
    jetbrains.idea-ultimate
    (lutris.override {extraLibraries = pkgs: [];})
    unstable.wineWowPackages.waylandFull
    winetricks
    waypipe
    wl-clipboard
  ];
in {
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

    home.file.".config/ghostty/config" = {
      enable = true;
      text = builtins.readFile "${configDir}/ghostty/config";
    };
  };
}
