{ pkgs, ... }:
{
  home-manager.users."vasco".programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };
}
