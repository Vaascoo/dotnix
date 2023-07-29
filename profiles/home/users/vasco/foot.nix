{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font Mono:size=9";
      };
      csd.preferred = "none";
      cursor.color = "191724 E0DEF4";
      colors.alpha = 0.90;
      colors = {
        background = "282828";
        foreground = "EBDBB2";
        regular0 = "282828";
        regular1 = "CC241D";
        regular2 = "98971A";
        regular3 = "D79921";
        regular4 = "458588";
        regular5 = "B16286";
        regular6 = "689D6A";
        regular7 = "A89984";
        bright0 = "928374";
        bright1 = "FB4934";
        bright2 = "B8BB26";
        bright3 = "FABD2F";
        bright4 = "83A598";
        bright5 = "D3869B";
        bright6 = "8EC07C";
        bright7 = "EBDBB2";
      };
    };
  };
}
