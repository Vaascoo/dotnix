{pkgs, ...}: {
  # super lazy
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  home.packages = with pkgs; [latest.vscode-fhs];
}
