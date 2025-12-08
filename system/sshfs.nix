fileSystems."/mnt/skull" = {
  device = "eui@home.ttpk.fi:/mnt/skull";
  fsType = "sshfs";
  options = [
    "nodev"
    "noatime"
    "allow_other"
    "IdentityFile=/home/elli/.ssh/id_ed25519"
  ];
};
