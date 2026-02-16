{ config, lib, pkgs, ... }:

{
    security = {
        polkit.enable = true;
        rtkit.enable = true;

        pam = {
            services.swaylock = {};
            loginLimits = [
                { domain = "@realtime"; item = "rtprio"; type = "-"; value = 1; }
            ];
        };

        sudo = {
            enable = true;

            extraRules = [
                {
                    commands = [
                        {
                            command = "${pkgs.systemd}/bin/reboot";
                            options = [ "NOPASSWD" ];
                        }
                        {
                            command = "${pkgs.systemd}/bin/poweroff";
                            options = [ "NOPASSWD" ];
                        }
                    ];

                    groups = [ "powermanagement" ];
                }
            ];
        };
    };
}
