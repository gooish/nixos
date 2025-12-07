{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                
                font = "Iosevka 10";
                corner_radius = 10;

                # Base colors
                background = "#262626";
                foreground = "#A8A8A8";

                frame_color = "#767676";
                separator_color = "frame";

                padding = 8;
                horizontal_padding = 10;
                transparency = 0;
                separator_height = 2;
                line_height = 0;
                word_wrap = "yes";
                ignore_newline = "no";
                origin = "top-right";
                offset = "20x20";
            };
            urgency_low = {
                background = "#303030";
                foreground = "#A8A8A8";
                frame_color = "#303030";
            };
            urgency_normal = {
                background = "#262626";
                foreground = "#A8A8A8";
                frame_color = "#767676";
            };
            urgency_critical = {
                background = "#D370A3";
                foreground = "#FFFFFF";
                frame_color = "#FFA7DA";
            };
        };
    };
}