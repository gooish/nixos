{	
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
			selection.save_to_clipboard = false;
            window = {
                dynamic_title = false;

            };
            cursor = {
                shape = "beam";
            };

            # invisibone

            colors = {
                primary = {
                    foreground = "#A0A0A0";
                    background = "#232323";
                    dim_foreground = "#A0A0A0";
                    dim_background = "#232323";


                };
                
                normal = {
                    black = "#303030";
                    red = "#D370A3";
                    green = "#6D9E3F";
                    yellow = "#B58858";
                    blue = "#6095C5";
                    magenta = "#AC78DE";
                    cyan = "#3BA275";
                    white = "#D0D0D0";
                };
            };
		};
	};
}