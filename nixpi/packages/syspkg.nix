{ config, lib, pkgs, extpkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix

        git
        curl
        wget

        extpkgs.agenix
    ];
}
