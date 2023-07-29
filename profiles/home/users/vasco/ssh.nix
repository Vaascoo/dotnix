{ config, configDir, pkgs, ... }:

let
  sshHome = ''
    Host raft
      hostname raft.burro-beta.ts.net
      port 22
      user vasco
  '';
in
{
  programs.ssh = {
    enable = true;
    extraConfig = sshHome + (builtins.readFile "${configDir}/ssh/inesc");
  };
}
