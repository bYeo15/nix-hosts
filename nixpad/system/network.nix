{ config, lib, pkgs, extlib, secrets, ... }:

{
    time.timeZone = "Australia/Sydney";

    age.secrets.netSecrets = {
        file = secrets.netSecrets;
    };

    networking = {
        hostName = "nixos";

        nat = {
            enable = true;
            externalInterface = "wlp0s1";
            internalInterfaces = [ "tun0" ];
        };

        firewall = {
            enable = true;
            trustedInterfaces = [ "tun0" "docker0" ];
        };

        resolvconf.enable = false;

        useDHCP = lib.mkDefault true;
    };

    networking.networkmanager = {
        enable = true;

        ensureProfiles.environmentFiles = [ config.age.secrets.netSecrets.path ];

        insertNameservers = [ "1.1.1.1" "1.0.0.1" ];

        ensureProfiles.profiles = extlib.filterTagged "profile" [ "home" "external" ] config.netConn.connections;
    };
}
