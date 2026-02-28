{ config, lib, pkgs, ... }:

{
    imports = [
        ./dnsmasq.nix
        ./openssh.nix
        ./pihole.nix
    ];
}
