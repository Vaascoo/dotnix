{
  pkgs,
  configDir,
  ...
}: {
  home.packages = [pkgs.jetbrains.idea-ultimate];
  home.file.".ideavimrc" = {
    enable = true;
    text = builtins.readFile "${configDir}/nvim/init.vim";
  };
}
