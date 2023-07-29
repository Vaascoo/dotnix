{ pkgs, lib, ... }:
pkgs.vimUtils.buildVimPluginFrom2Nix {
  name = "aquarium-nvim";
  src = pkgs.fetchFromGitHub {
    owner = "FrenzyExists";
    repo = "aquarium-vim";
    rev = "d09b1feda1148797aa5ff0dbca8d8e3256d028d5";
    sha256 = "sha256-CtyEhCcGxxok6xFQ09feWpdEBIYHH+GIFVOaNZx10Bs=";
  };
}
