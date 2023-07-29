{ pkgs, configDir, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile "${configDir}/kitty/kitty.conf";
  };
}
