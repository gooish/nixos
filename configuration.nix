# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./system/audio.nix
      ./system/fonts.nix
      ./system/hyprland.nix
      ./system/network.nix
      ./system/nvidia.nix
      ./system/packages.nix
      ./system/steam.nix
      ./system/udev.nix
    ];

  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  fileSystems =
    let
    ntfs-drives = [
      "/mnt/nvme1"
      ];
    in
    lib.genAttrs ntfs-drives (path: {
        options = [
            "uid=1000" # REPLACE "$UID" WITH YOUR ACTUAL UID!
        # "nofail"
        ];
    });

  users.users.elli = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;



  programs.thunar.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}

