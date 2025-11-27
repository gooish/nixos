{ config, lib pkgs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;

            preload = ["../resources/wallpaper.jpg"];

            wallpaper = [",../resources/wallpaper.jpg"];

        };
    };
}