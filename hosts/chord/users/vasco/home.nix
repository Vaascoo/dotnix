{
  pkgs,
  profiles,
  configDir,
  ...
}: let
  installedPackages = with pkgs; [
    alejandra
    ghostty
    remmina
    protonmail-bridge
    diff-so-fancy
    gh
    helvum
    evince
    discord
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
    lazygit
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
      vscode
      streaming
      ssh
      foot
      fzf
      kitty
      gc
      gtk
      zsh
      neovim
      git
      tmux
      firefox
      direnv
      ghostty
    ];

    home = {
      username = "vasco";
      homeDirectory = "/home/vasco";
      stateVersion = "22.05";
    };

    systemd.user.services = {
      protonmail-bridge = {
        Unit.Description = "Proton Mail Bridge server";
        Install.WantedBy = ["graphical-session.target"];
        Service.ExecStart = "${pkgs.unstable.protonmail-bridge}/bin/protonmail-bridge -n";
      };
    };
    programs.home-manager.enable = true;

    home.packages = installedPackages;
  };
}
