{
  pkgs,
  lib,
  ...
}:
pkgs.vimUtils.buildVimPluginFrom2Nix {
  name = "tokyonight-nvim";
  src = pkgs.fetchFromGitHub {
    owner = "folke";
    repo = "tokyonight.nvim";
    rev = "161114bd39b990995e08dbf941f6821afbdcd666";
    sha256 = "IMrqcx/f5cauDBxSLP1bjsaFXLBv24XXCPxpyj+Jb/E=";
  };
}
