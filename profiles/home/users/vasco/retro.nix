{pkgs, ...}: {
  home.packages = with pkgs; [
    bsnes
  ];
}
