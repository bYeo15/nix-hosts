{ sources, config, lib, pkgs, ... }:

{
    nix.optimise = {
        automatic = true;
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };

    nix.settings = {
        trusted-users = [ "root" "ben" ];
        experimental-features = [ "nix-command" "flakes" ];
    };

    nix.registry.nixpkgs = {
        to = {
            type = "path";
            path = sources.nixpkgs.outPath;
        };
    };

    nixpkgs.flake.source = sources.nixpkgs.outPath;
}
