{
  pkgs,
  lib,
  config,
  ...
}: {
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
  services.logind = {
    lidSwitch = "lock";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
  };
}
