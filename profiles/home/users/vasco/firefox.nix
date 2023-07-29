{ pkgs, ... }:
{
  home-manager.users."vasco".home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  home-manager.users."vasco".programs.firefox = {
    enable = true;
  };
}
