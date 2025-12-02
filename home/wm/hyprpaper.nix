{ config, lib, pkgs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;

            preload = ["~/.nixos/resources/cats.png"];

            wallpaper = [",contain:~/.nixos/resources/cats.png"];

        };
    };
}