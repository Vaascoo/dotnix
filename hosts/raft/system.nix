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
    # restricted.vasco.secureboot
    restricted.vasco.disable_suspend
    restricted.vasco.acme
    restricted.vasco.gitea
    restricted.vasco.ssh
    restricted.vasco.sshKeys
    restricted.vasco.age
    restricted.vasco.gnome
    restricted.vasco.keymap
    restricted.vasco.minio
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
    prismlauncher
  ];

  services.gitlab-runner = {
    enable = true;
    clear-docker-cache.enable = true;
    configFile = config.age.secrets.gitlabRunner.path;
  };

  #TODO this will be moved from here
  services.nginx = {
    enable = true;

    virtualHosts = {
      "git.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:3000";
        extraConfig = ''
          client_max_body_size 1024M;
        '';
      };

      "faas.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:8080";
        extraConfig = ''
        '';
      };

      "s3.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:9000";
        extraConfig = ''
          client_max_body_size 1024M;
        '';
      };

      "minio.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:9001";
        extraConfig = ''
        '';
      };

      "sonarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:8989";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "bazarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:6767";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "lidarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:8686";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "prowlarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:9696";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "radarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:7878";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "readarr.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:8787";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "transmission.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:9091";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };

      "jellyfin.vaascoo.pt" = {
        forceSSL = true;
        useACMEHost = "vaascoo.pt";
        locations."/".proxyPass = "http://127.0.0.1:8096";
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection;
        '';
      };
    };
  };
  users.groups.media = {};
  users.users.media = {
    isSystemUser = true;
    group = "media";
    extraGroups = ["media"];
  };
  users.users.nginx.extraGroups = ["acme"];

  networking.firewall.enable = false;
  programs.zsh.enable = true;

  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

  security.rtkit.enable = true;

  programs.dconf.enable = true;

  services.dbus.enable = true;

  security.pki.certificateFiles = ["${configDir}/certificates/ist.crt" "${configDir}/certificates/rnl.crt" "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"];

  boot.supportedFilesystems = ["ntfs" "zfs"];
  boot.binfmt.emulatedSystems = ["armv6l-linux"];

  services.avahi.enable = true;
  services.flatpak.enable = true;

  powerManagement.enable = false;

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services.sonarr = {
    enable = true;
    user = "media";
    group = "media";
  };

  services.bazarr = {
    enable = true;
    user = "media";
    group = "media";
  };

  services.lidarr = {
    enable = true;
    user = "media";
    group = "media";
  };

  services.prowlarr = {
    enable = true;
  };

  services.radarr = {
    enable = true;
    user = "media";
    group = "media";
  };

  services.readarr = {
    enable = true;
    user = "media";
    group = "media";
  };

  services.transmission = {
    enable = true;
    user = "media";
    group = "media";
    webHome = pkgs.flood-for-transmission;
  };

  services.jellyfin = {
    enable = true;
    group = "media";
    user = "jellyfin";
  };

  programs.steam = {
    enable = true;
  };

  system.stateVersion = "22.05";
}
