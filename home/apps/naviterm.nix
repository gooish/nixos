{pkgs, inputs, ...}: {
  environment.systemPackages = [
    inputs.naviterm.packages.${pkgs.system}.default
  ];
}
