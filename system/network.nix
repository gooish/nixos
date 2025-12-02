{ config, lib, pkgs, ... }:


{
    networking.hostName = "ten-of-swords"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    networking.extraHosts =
        ''
        192.168.8.130 home.ttpk.fi
        192.168.8.130 jellyfin.home.ttpk.fi
        '';
}