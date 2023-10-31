{pkgs, ...}: {
  # By luishfonseca:
  # https://gist.github.com/luishfonseca/f183952a77e46ccd6ef7c907ca424517
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };
}
