{ config, pkgs, ... }:

{

	imports = [
		./home/waybar.nix
		./home/hyprland.nix
	];

	home.username = "elli";
	home.homeDirectory = "/home/elli";
  
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
	];

	
	
	programs.alacritty = {
		enable = true;
		settings = {
			env.term = "xterm-256color";
			font = {
				size = 10;
			};
			selection.save_to_clipboard = true;
		};
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {
			mkcdir = "mkdir $_ && cd $_";
		};
		initExtra = ''
			if uwsm check may-start && uwsm select; then
				exec uwsm start default
			fi
		'';
	};

	home.stateVersion = "25.05";
}
