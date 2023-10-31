{
  configDir,
  pkgs,
  ...
}: {
  xdg.desktopEntries = {
    notion = {
      name = "Notion";
      icon = "${configDir}/icons/Notion.png";
      exec = "${pkgs.brave}/bin/brave --new-window --app=\"https://www.notion.so\"";
      terminal = false;
      categories = ["Application"];
    };
    netflix = {
      name = "Netflix";
      icon = "${configDir}/icons/Netflix.png";
      exec = "${pkgs.brave}/bin/brave --new-window --app=\"https://www.netflix.com\"";
      terminal = false;
      categories = ["Application"];
    };
    hbo = {
      name = "HBO Max";
      icon = "${configDir}/icons/hbo.png";
      exec = "${pkgs.brave}/bin/brave --new-window --app=\"https://play.hbomax.com/profile/select\"";
      terminal = false;
      categories = ["Application"];
    };
    amazonPrimeVideo = {
      name = "Amazon Prime Video";
      icon = "${configDir}/icons/prime_video.png";
      exec = "${pkgs.brave}/bin/brave --new-window --app=\"https://www.primevideo.com\"";
      terminal = false;
      categories = ["Application"];
    };
  };
}
