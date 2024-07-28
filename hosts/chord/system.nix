# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  configDir,
  pkgs,
  profiles,
  ...
}: {
  imports = with profiles.system; [
    general.doh
    general.fonts
    general.virt
    general.zfs
    general.pipewire
    general.wayland
    restricted.vasco.tailscale
    restricted.vasco.hwAccel
    restricted.vasco.secureboot
    restricted.vasco.wireguard
    restricted.vasco.age
    restricted.vasco.gnome
    restricted.vasco.keymap
  ];

  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  networking.hostId = "5e8c59c3";

  # Select internationalisation properties.
  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable smart card reader
  services.pcscd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.users.vasco = {
    isNormalUser = true;
    description = "Vasco Correia"; # full name in gdm
    extraGroups = ["audio" "docker" "video" "wheel" "networkmanager" "libvirtd" "dialout"]; # Enable ‘sudo’ for the user.
    initialHashedPassword = "$6$DzeNGzM3T9/NALiy$iHZ.pTMGbqhdMzcpwTuZ8dM6zGGoH.7M/m5GBAK5v3tdg2rpYcnSq8k3VlEwsvbOjv/fcK2BR7E8yt69nE9BR/";
    shell = pkgs.zsh;
  };

  users.users.root.initialHashedPassword = "$6$3JxKzQC6CWN0Xpuk$RQsbyj5s4jb3EY8deMNtoClypHCQXJkSbDtQ/KxVEQ6qhxxP4g9iXDxkTmH28tsWPm6kkDlg1ae34f.amWUVs0";

  environment.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  environment.systemPackages = with pkgs; [
    (agenix.override {
      ageBin = "${pkgs.age}/bin/age";
    })
    prismlauncher
    sysstat
    pciutils
    usbutils
    iw
    nmap
    file
    unzip
    virt-manager
    unstable.python3
    inetutils
    lsof
    docker-compose
    tmux
    wireguard-tools
    iproute2
    ripgrep
    wget
    zip
    unzip
    dnsutils
    nixpkgs-fmt
    vagrant
    gnome.seahorse
    virtiofsd
  ];

  networking.firewall.enable = false;
  programs.zsh.enable = true;

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        ControllerMode = "bredr";
      };
    };
  };

  services.blueman.enable = true;

  security.rtkit.enable = true;

  programs.dconf.enable = true;

  services.dbus.enable = true;

  security.pki.certificateFiles = ["${configDir}/certificates/ist.crt" "${configDir}/certificates/rnl.crt" "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"];

  boot.supportedFilesystems = ["ntfs" "zfs"];
  boot.binfmt.emulatedSystems = ["armv6l-linux"];

  services.avahi.enable = true;
  services.flatpak.enable = true;

  programs.steam.enable = true;

  system.stateVersion = "22.05";
}
