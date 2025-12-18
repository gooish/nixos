{pkgs, inputs, config, ...}: {
  environment.systemPackages = [
    inputs.naviterm.packages.${pkgs.system}.default
  ];
}
