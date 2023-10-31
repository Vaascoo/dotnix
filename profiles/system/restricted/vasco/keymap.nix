{
  config,
  lib,
  pkgs,
  ...
}: {
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };
  services.xserver.layout = lib.mkIf config.services.xserver.enable "pt";
}
