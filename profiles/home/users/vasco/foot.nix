{pkgs, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font Mono:size=16";
      };
      csd.preferred = "none";
      colors.alpha = 0.90;
      cursor.color = "1A1826 D9E0EE";

      colors = {
        foreground = "D9E0EE";
        background = "1E1D2F";
        regular0 = "6E6C7E";
        regular1 = "F28FAD";
        regular2 = "ABE9B3";
        regular3 = "FAE3B0";
        regular4 = "96CDFB";
        regular5 = "F5C2E7";
        regular6 = "89DCEB";
        regular7 = "D9E0EE";
        bright0 = "988BA2";
        bright1 = "F28FAD";
        bright2 = "ABE9B3";
        bright3 = "FAE3B0";
        bright4 = "96CDFB";
        bright5 = "F5C2E7";
        bright6 = "89DCEB";
        bright7 = "D9E0EE";
      };
    };
  };
}
