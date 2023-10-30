{ configDir, pkgs, lib, config, ... }:
{
  age = {
    identityPaths =
      [ "/home/vasco/.ssh/id_ed25519" ];
    ageBin = "${pkgs.age}/bin/age";
    secrets = {
      wireguard = lib.mkIf (builtins.hasAttr "wgrnl" config.networking.wg-quick.interfaces) {
        file = "${configDir}/secrets/wireguard.age";
        mode = "0600";
      };
      gitlabRunner = lib.mkIf (config.services.gitlab-runner.enable) {
        file = "${configDir}/secrets/runner.age";
        mode = "0600";
      };
    };
  };
}
