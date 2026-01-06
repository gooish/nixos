{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        alacritty
        rofi
        killall
        git
        rose-pine-hyprcursor
        # shadps4_git
        libnotify
        glib
        cheese
        lxqt.lxqt-policykit
        cifs-utils
        libsecret
        transmission_4-gtk
        playerctl
        xarchiver
        protontricks
        (callPackage ../packages/stmps {})
    ];
}