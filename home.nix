{ config, pkgs, ... }:

{

	imports = [
		./home/wm/waybar.nix
		./home/wm/hyprland.nix
		./home/wm/hyprlock.nix
		./home/wm/hypridle.nix
		./home/wm/cycler.nix
		# ./home/wm/hyprpaper.nix
		./home/apps/alacritty.nix
		./home/apps/misc.nix
		./home/apps/bash.nix


	];

	home.username = "elli";
	home.homeDirectory = "/home/elli";
  
  	dconf.settings = {
    	"org/gnome/desktop/interface" = {
      		color-scheme = "prefer-dark";
    	};
    };

	xdg.portal = {
  		enable = true;
  		extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
  		configPackages = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
	};



	home.stateVersion = "25.05";
}
