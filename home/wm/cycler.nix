{ pkgs, ... }:

let
  # path to the script in your dotfiles repo (relative to the nix file)
  localScript = ./resources/cycle_workspace.sh;
in
{
  # ensure jq is available
  home.packages = with pkgs; [ jq ];

  # copy the script into place and mark executable
  home.file.".config/hypr/scripts/cycle_workspace.sh".source = localScript;
  home.file.".config/hypr/scripts/cycle_workspace.sh".mode = "0755";
}
