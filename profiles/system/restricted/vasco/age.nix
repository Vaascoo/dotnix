{ configDir, pkgs, ... }:
{
  age = {
    identityPaths =
      [ "/home/vasco/.ssh/id_ed25519" ];
    ageBin = "${pkgs.age}/bin/age";
    secrets = {
      wireguard = {
        file = "${configDir}/secrets/wireguard.age";
        mode = "0600";
      };
      gitlabRunner = {
        file = "${configDir}/secrets/runner.age";
        mode = "0600";
      };
    };
  };
}
