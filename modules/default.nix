{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    environment = {
      etc = {
        "NetworkManager/conf.d/10-iwd.conf".text = ''
          [device]
          wifi.backend=iwd
        '';
      };
      # systemPackages = [];
    };

    systemd.services = {
      battery = {
        enable = true;
        serviceConfig = {
          Type = "oneshot";
          Restart = "on-failure";
          ExecStart = "/bin/bash -c 'echo 60 > /sys/class/power_supply/BAT1/charge_control_end_threshold'";
        };
        wantedBy = ["system-manager.target"];
      };
    };
  };
}
