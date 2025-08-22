{
  configDir,
  pkgs,
  ...
}: {
  home.packages = [ pkgs.ghostty ];
  home.file.".config/ghostty/config" = {
    enable = true;
    text = builtins.readFile "${configDir}/ghostty/config";
  };
}
