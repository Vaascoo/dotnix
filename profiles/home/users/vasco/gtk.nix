{ pkgs, ... }:
{
  home-manager.users."vasco".gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Yaru-dark";
    };
    theme = {
      package = pkgs.yaru-theme;
      name = "Yaru-dark";
    };
  };
}
