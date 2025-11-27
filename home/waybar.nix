{
	lib,
	config,
	pkgs,
	...
}:

{
	programs.waybar = {
		enable = true;
		systemd.enable = true;
		settings = [{
			height = 24;
			spacing = 4;

			modules-left = ["hyprland/workspaces"];
			modules-center = ["hyprland/window"];
			modules-right = ["hyprland/language" "cpu" "clock" "tray"];
		}];
	};
}
