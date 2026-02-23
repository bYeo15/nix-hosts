{ config, lib, pkgs, ... }:

{
    services = {
        dbus.enable = true;
        envfs.enable = true;

        tlp = {
            enable = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

                CPU_BOOST_ON_AC = 0;
                CPU_BOOST_ON_BAT = 0;

                START_CHARGE_THRESH_BAT0 = 75;
                STOP_CHARGE_THRESH_BAT0 = 80;
            };
        };

        logind = {
            settings.Login = {
                HandleLidSwitch = "ignore";
                HandleLidSwitchExternalPower = "ignore";
                HandleLidSwitchDocked = "ignore";
            };
        };

        # fwupd = {
        #     enable = true;
        # };
    };
}
