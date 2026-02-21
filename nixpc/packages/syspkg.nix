{ config, lib, pkgs, extpkgs, ... }:

let
    # Entrypoint for dwm + sunshine + steam big picture
    steamLauncher = pkgs.writeShellScriptBin "steamLauncher" ''
        xrandr -s 1920x1200

        dwm &
        sunshine &>~/sunlog &
        steam -tenfoot &>~/steamlog
    '';
in {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        xdotool
        steamLauncher

        (retroarch.withCores (cores: with cores; [
            citra
            dolphin
            pcsx-rearmed
            pcsx2
        ]))

        retroarch-assets

        extpkgs.agenix
    ];

    programs.gamemode = {
        enable = true;
    };

    programs.gamescope = {
        enable = true;
        capSysNice = true;
    };

    programs.steam = {
        enable = true;
        package = pkgs.steam.override {
            extraPkgs = pkgs': with pkgs'; [
                xorg.libXcursor
                xorg.libXi
                xorg.libXinerama
                xorg.libXScrnSaver
                libpng
                libpulseaudio
                libvorbis
                stdenv.cc.cc.lib
                libkrb5
                keyutils

                # Retroarch
                libglvnd
            ];
        };
    };
}
