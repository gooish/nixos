{ config, pkgs, ... }:

{

	imports = [
		./home/waybar.nix
		./home/hyprland.nix
		# ./home/hyprpaper.nix
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
	];

	
	
	programs.alacritty = {
		enable = true;
		settings = {
			env.term = "xterm-256color";
			font = {
				normal = {
					family = "Iosevka";
					style = "Regular";
				};
				bold = {
					family = "Iosevka";
					style = "Bold";
				};
				italic = {
					family = "Iosevka";
					style = "Italic";
				};
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
