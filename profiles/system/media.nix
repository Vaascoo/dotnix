{pkgs, ...}: {
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
}
