{ config, lib, pkgs, extpkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        npins

        zcfan

        helix

        htop

        linux-manual
        man-pages
        man-pages-posix
        binutils.man

        nettools
        update-resolv-conf

        qemu

        git
        curl
        wget

        extpkgs.agenix
        extpkgs.home-manager

        moonlight-qt
    ];

    programs.dconf.enable = true;

    documentation = {
        enable = true;
        dev.enable = true;
        doc.enable = true;
        man.enable = true;
    };
}
