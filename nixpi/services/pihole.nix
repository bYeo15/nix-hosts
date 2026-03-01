{ config, pkgs, lib, ... }:

{
    services.pihole-ftl = {
        enable = true;

        settings = {
            dns = {
                upstreams = [ "1.1.1.1" "1.0.0.1" ];
                interface = "end0";
            };
            dhcp = {
                active = true;
                start = "10.0.0.10";
                end = "10.0.0.254";
                router = "10.0.0.1";
                netmask = "255.255.255.0";
                leaseTime = "6h";
                hosts = config.netConn.dhcpConfig;
            };
        };

        privacyLevel = 3;
    };

    services.pihole-web = {
        enable = true;
        ports = [ "443s" ];
    };
}
