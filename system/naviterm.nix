{pkgs, config, ...}: {
  environment.systemPackages = [
    pkgs.naviterm
  ];
}