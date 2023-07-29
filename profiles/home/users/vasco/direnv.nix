{ pkgs, ... }:
{
  home-manager.users."vasco".programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
