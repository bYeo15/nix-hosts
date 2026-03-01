{ config, lib, pkgs, ... }:

{
    imports = [
        ./openssh.nix
        ./pihole.nix
    ];
}
