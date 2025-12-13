{
    fileSystems."/home/elli/SKULL" = {
        device = "//192.168.8.130/SKULL";
        fsType = "cifs";
        options = let
            automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
        in ["${automount_opts},credentials=/home/elli/.nixos/smb_secret,uid=1000,gid=100"];
    };
}
