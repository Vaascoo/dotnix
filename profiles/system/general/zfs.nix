{
  config,
  pkgs,
  ...
}: {
  # try going back to a stable kernel to fix amdgpu errors on boot
  # boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/etc/secureboot"
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/lib"
      "/var/log"
      "/etc/ssh"
      "/etc/secrets"
      "/etc/gitlab-runner"
      "/etc/rancher/k3s"
    ];
  };
  environment.etc."machine-id".source = "/nix/persist/etc/machine-id";
}
