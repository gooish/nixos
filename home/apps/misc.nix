{ config, lib, pkgs, ... }:


{
    	home.packages = with pkgs; [
		neofetch
		zip
		xz
		unzip
		p7zip

		jq
		yt-dlp

		dnsutils
		nmap
		
		file
		which
		gnupg

		btop

		sysstat
		lm_sensors
		pciutils
		usbutils
		
		vscode

		swaybg

		discord
		telegram-desktop

		pavucontrol

		solaar

		nwg-displays
		gamescope

		grim
		slurp
		wl-clipboard

		swayidle

		clonehero
		vesktop
		xeyes
	];
}