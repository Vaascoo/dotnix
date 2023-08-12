{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      package = (pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["lavender"];
      });
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
    };
  };
}
