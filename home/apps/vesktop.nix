 {
    let
        localScript = ../../resources/DiscordRecolor.Theme.css;
    in
    {
        home.file."..config/vesktop/DiscordRecolor.Theme.css".source = localScript;
    };
    programs.vesktop = {
        enable = true;
        settings = {
            appBadge = true;
            arRPC = true;
            checkUpdates = true;
            discordBranch = stable;
            vencord = {
                settings = {
                    enabledThemes = [ "DiscordRecolor.Theme.css" ];
                    plugins = {
                        ExpressionCloner.enable = true;
                        WebKeybinds.enable = true;
                        WebScreenShareFixes.enable = true;
                        CrashHandler.enable = true;
                    };
                };
            };
        };
    };
}