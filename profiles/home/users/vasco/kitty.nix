{ pkgs, configDir, ... }:
{
  home-manager.users."vasco".programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile "${configDir}/kitty/kitty.conf";
  };
}
