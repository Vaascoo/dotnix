{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (agenix.override {
      ageBin = "${pkgs.age}/bin/age";
    })
    distrobox
    dnsutils
    docker-compose
    file
    seahorse
    inetutils
    iproute2
    inotify-tools
    iw
    lsof
    nixpkgs-fmt
    nmap
    pciutils
    prismlauncher
    ripgrep
    sysstat
    tmux
    unstable.python3
    unzip
    unzip
    usbutils
    virtiofsd
    virt-manager
    wget
    wireguard-tools
    zip
  ];

  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };

  users.mutableUsers = false;
  users.users = {
    vasco = {
      isNormalUser = true;
      description = "Vasco Correia"; # full name in gdm
      extraGroups = ["audio" "docker" "video" "wheel" "networkmanager" "libvirtd" "dialout" "fuse"]; # Enable ‘sudo’ for the user.
      initialHashedPassword = "$6$DzeNGzM3T9/NALiy$iHZ.pTMGbqhdMzcpwTuZ8dM6zGGoH.7M/m5GBAK5v3tdg2rpYcnSq8k3VlEwsvbOjv/fcK2BR7E8yt69nE9BR/";
      shell = pkgs.zsh;
    };
    root.initialHashedPassword = "$6$3JxKzQC6CWN0Xpuk$RQsbyj5s4jb3EY8deMNtoClypHCQXJkSbDtQ/KxVEQ6qhxxP4g9iXDxkTmH28tsWPm6kkDlg1ae34f.amWUVs0";
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

  security.rtkit.enable = true;

  services.avahi.enable = true;
  services.flatpak.enable = true;
  programs.zsh.enable = true;

  programs.steam.enable = true;
}
