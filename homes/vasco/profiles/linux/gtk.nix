{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };
}
