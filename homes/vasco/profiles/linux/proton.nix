{ pkgs, ... }:{
    systemd.user.services.protonmail-bridge = {
      Unit.Description = "Proton Mail Bridge server";
      Install.WantedBy = ["graphical-session.target"];
      Service.ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge -n";
    };
}
