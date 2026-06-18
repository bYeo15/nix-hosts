{ config, lib, pkgs, ... }:

{
    services.greetd = {
        enable = true;
        settings = {
            # fix for argument bug (prevents errors for newline in config)
            # TODO : this will probably be broken again and/or unnecessary when fixed
            default_session.command = lib.join " " [
                (lib.getExe pkgs.tuigreet)
                "--time"
                "--asterisks"
                "--user-menu"
                "--cmd ${lib.getExe pkgs.bash}"
            ];
        };
    };
}
