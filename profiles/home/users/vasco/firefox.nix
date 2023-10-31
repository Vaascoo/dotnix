{pkgs, ...}: {
  home.sessionVariables.MOZ_USE_XINPUT2 = "1";
  programs.firefox = {
    enable = true;
  };
}
