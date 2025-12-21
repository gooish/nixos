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
			height = 35;
			spacing = 4;

			modules-left = ["hyprland/workspaces"];
			modules-center = ["custom/previous" "custom/music" "custom/next"];
			modules-right = [ "cpu" "clock" "tray"];
            margin-top = 10;
            margin-right = 10;
            margin-left = 10;
            margin-bottom = 0;

            "custom/music" = {
                format = "{}";
                escape = true;
                interval = 1;
                tooltip = true;
                exec = "playerctl metadata --format '{{ status }}: {{ artist }} - {{ title }}'";
                on-click= "playerctl play-pause";
                on-click-right = "playerctl next";
                on-click-middle = "playerctl previous";
                max-length = 100;
            };

            "custom/previous" = {
                format = " ⏮ ";
                on-click = "playerctl previous";
            };

            "custom/next" = {
                format = " ⏭ ";
                on-click = "playerctl next";
            };

		}];





		style = ''

    
* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Iosevka, Roboto, Helvetica, Arial, sans-serif;
    font-size: 14px;

}

/* color vars */

@define-color background #262626;
@define-color foreground #A8A8A8;

@define-color black     #303030;
@define-color lblack     #767676;

@define-color white     #D0D0D0;
@define-color lwhite    #FFFFFF;

@define-color red     #D370A3;
@define-color lred    #FFA7DA;

@define-color green     #6D9E3F;
@define-color lgreen    #A3D572;

@define-color blue     #6095C5;
@define-color lblue    #98CBFE;

@define-color yellow     #B58858;
@define-color lyellow    #EFBD8B;

@define-color cyan     #3BA275;
@define-color lcyan    #75DAA9;

@define-color magenta     #AC7BDE;
@define-color lmagenta    #E5B0FF;


window#waybar {
    background-color: @background;
    background: @background;
    border-bottom: 3px solid @lblack;
    color: @foreground;
    transition-property: background-color;
    transition-duration: .5s;
    border-radius: 10px;
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: @foreground;
}
*/

window#waybar.termite {
    background-color: #3F3F3F;
}

window#waybar.chromium {
    background-color: #000000;
    border: none;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px @foreground;
}

/* you can set a style on hover for any module like this */
#pulseaudio:hover {
    background-color: @yellow;
}

#workspaces {
    padding-left: 10px;
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: @foreground;
}

#workspaces button.empty {
    padding: 0 5px;
    background-color: @background;
    color: @foreground;
}

#workspaces button:hover {
    background: @black;
}

#workspaces button.focused, #workspaces button.active {
    background-color: @black;
    box-shadow: inset 0 -3px @white;
}

#workspaces button.urgent {
    background-color: @red;
}

#mode {
    background-color: @lblack;
    box-shadow: inset 0 -3px @white;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#power-profiles-daemon,
#mpd {
    padding: 0 10px;
    color: @white;
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    background-color: @lblack;
    color: @lwhite;
}

#battery {
    background-color: @white;
    color: @black;
}

#battery.charging, #battery.plugged {
    color: #ffffff;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: steps(12);
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#power-profiles-daemon {
    padding-right: 15px;
}

#power-profiles-daemon.performance {
    background-color: #f53c3c;
    color: #ffffff;
}

#power-profiles-daemon.balanced {
    background-color: #2980b9;
    color: #ffffff;
}

#power-profiles-daemon.power-saver {
    background-color: #2ecc71;
    color: #000000;
}

label:focus {
    background-color: #000000;
}

#cpu {
    background-color: @green;
    color: @black;
}

#memory {
    background-color: @magenta;
}

#disk {
    background-color: @yellow;
}

#backlight {
    background-color: #90b1b1;
}

#network {
    background-color: #2980b9;
}

#network.disconnected {
    background-color: #f53c3c;
}

#pulseaudio {
    background-color: #f1c40f;
    color: #000000;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#wireplumber {
    background-color: #fff0f5;
    color: #000000;
}

#wireplumber.muted {
    background-color: #f53c3c;
}

#custom-media {
    background-color: #66cc99;
    color: #2a5c45;
    min-width: 100px;
}

#custom-media.custom-spotify {
    background-color: #66cc99;
}

#custom-media.custom-vlc {
    background-color: #ffa000;
}

#temperature {
    background-color: #f0932b;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray {
    background-color: @blue;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: @red;
}

#idle_inhibitor {
    background-color: #2d3436;
}

#idle_inhibitor.activated {
    background-color: #ecf0f1;
    color: #2d3436;
}

#mpd {
    background-color: #66cc99;
    color: #2a5c45;
}

#mpd.disconnected {
    background-color: #f53c3c;
}

#mpd.stopped {
    background-color: #90b1b1;
}

#mpd.paused {
    background-color: #51a37a;
}

#language {
    background: @cyan;
    color: @magenta;
    padding: 0 5px;
    margin: 0 5px;
    min-width: 16px;
}

#keyboard-state {
    background: #97e1ad;
    color: #000000;
    padding: 0 0px;
    margin: 0 5px;
    min-width: 16px;
}

#keyboard-state > label {
    padding: 0 5px;
}

#keyboard-state > label.locked {
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad {
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad.empty {
	background-color: transparent;
}

#privacy {
    padding: 0;
}

#privacy-item {
    padding: 0 5px;
    color: @white;
}

#privacy-item.screenshare {
    background-color: #cf5700;
}

#privacy-item.audio-in {
    background-color: #1ca000;
}

#privacy-item.audio-out {
    background-color: #0069d4;
}
		'';
	};
}
