{ config, lib, pkgs, ... }:

{
    imports = [
        ./sysservices.nix
        ./openssh.nix
        ./openvpn.nix
        ./pipewire.nix
        ./tuigreet.nix
    ];
}
