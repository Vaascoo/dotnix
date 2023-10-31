{
  pkgDir,
  lib,
  ...
}: final: prev: rec {
  vasco.catppuccinTmux = final.callPackage ../packages/catppuccinTmux.nix {mkTmuxPlugin = prev.tmuxPlugins.mkTmuxPlugin;};
  vasco.rosePineTmux = final.callPackage ../packages/rosePineTmux.nix {mkTmuxPlugin = prev.tmuxPlugins.mkTmuxPlugin;};
  vasco.tokyoNightTmux = final.callPackage ../packages/tokyoTmux.nix {mkTmuxPlugin = prev.tmuxPlugins.mkTmuxPlugin;};
  vasco.vimPio = final.callPackage ../packages/vimPio.nix {};
  vasco.aquarium-nvim = final.callPackage ../packages/aquarium-nvim.nix {};
  vasco.tokyoNightNvim = final.callPackage ../packages/tokyoNightNvim.nix {};
  vasco.obsidian = final.callPackage ../packages/obsidian.nix {electron = prev.unstable.electron_27;};
}
