{ pkgs, ... }:

{
  services.fail2ban = {
    enable = true;
    bantime-increment.enable = true;
  };
  services.openssh.logLevel = lib.mkIf config.services.openssh.enable "VERBOSE";
}
