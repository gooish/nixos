{
  services.openssh = {
    enable = true;
  };
  users.users."elli".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtDAmK23r7VuJEy9YLhwLH8x8om4TEbgis3jfax0Q1H"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE0ivjWDqZfoIZYGsNdaWgnfk3j+ZgS0w8LOCf4fBsU1"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHrviuEk4TQBHu8kPrPCdImhF2x2HMeNAULcN7/HSuaG"

  ];
}