{ config, lib, pkgs, externalPackages, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
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

        externalPackages.agenix
        externalPackages.home-manager

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
