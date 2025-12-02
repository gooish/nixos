    { pkgs, ... }:
    
    let
        localScript = ../../resources/DiscordRecolor.Theme.css;
    in
    {
        home.file.".config/vesktop/themes/DiscordRecolor.Theme.css".source = localScript;
    }