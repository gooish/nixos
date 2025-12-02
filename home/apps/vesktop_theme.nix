    { pkgs, ... }:
    
    let
        localScript = ../../resources/DiscordRecolor.Theme.css;
    in
    {
        home.file.".config/vesktop/DiscordRecolor.Theme.css".source = localScript;
    }