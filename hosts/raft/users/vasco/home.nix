{
  pkgs,
  profiles,
  configDir,
  ...
}: let
  installedPackages = with pkgs; [
    unstable.obsidian
    protonmail-bridge
    diff-so-fancy
    helvum
    evince
    (webcord.override {
      electron_24 = pkgs.unstable.electron_27;
    })
    firefox
    vlc
    spotify
    zoom-us
    calibre
    unstable.thunderbird
    neofetch
    pavucontrol
    feh
    alacritty
    dogdns
    qalculate-gtk
    joshuto
    transmission-gtk
    transmission-remote-gtk
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
    # for emacs
    libvterm
    libtool
    cmake
    gnumake
    gcc
  ];
in {
  services.emacs = {
    enable = true;
    package = pkgs.emacs28NativeComp; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

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
