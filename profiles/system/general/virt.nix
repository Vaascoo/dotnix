{ pkgs, ... }:

{
  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enable = true;
      daemon.settings = {
        live-restore = false;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    virtiofsd
  ];
}
