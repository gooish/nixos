{ config, lib, pkgs, ... }:

{ 
    programs.appimage = {
        enable = true;
        binfmt = true; # Enables direct execution (./appimage.AppImage)
        package = pkgs.appimage-run.override {
            extraPkgs = pkgs: [
                pkgs.fuse
            ];
        };
    };
    # If FUSE is needed (many appimages use it):
    boot.kernelModules = [ "fuse" ]; # 
}