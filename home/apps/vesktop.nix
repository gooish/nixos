 {
    programs.vesktop = {
        enable = true;
        settings = {
            appBadge = true;
            arRPC = true;
            checkUpdates = true;
            discordBranch = "stable";
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