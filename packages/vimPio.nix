{pkgs, ...}:
pkgs.vimUtils.buildVimPluginFrom2Nix {
  name = "vim-pio";
  src = pkgs.fetchFromGitHub {
    owner = "normen";
    repo = "vim-pio";
    rev = "9e17deef82671c53915ef701c2ab2b12b62712f8";
    sha256 = "sha256-zaGxli97vzJb0ESkaiDUcJOLcBbdTuiY710iE7OBKd0=";
  };
}
