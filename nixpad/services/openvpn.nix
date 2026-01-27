{ config, lib, pkgs, secrets, ... }:

{
    age.secrets.vpnCred = {
        file = secrets.vpnCred;
    };

    services.openvpn.servers = {
        jpProton = {
            config = ''
                config /etc/openvpn/jp-free-1.protonvpn.udp.ovpn
                auth-user-pass ${config.age.secrets.vpnCred.path}
            '';
            updateResolvConf = true;
            autoStart = false;
        };
        nlProton = {
            config = ''
                config /etc/openvpn/nl-free-1.protonvpn.udp.ovpn
                auth-user-pass ${config.age.secrets.vpnCred.path}
            '';
            updateResolvConf = true;
            autoStart = false;
        };
    };
}
