{ pkgs, ... }:

{
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
  environment.systemPackages = with pkgs; [
    virtiofsd
  ];
}
