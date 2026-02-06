{ config, lib, pkgs, ... }:


{
  fonts.packages = with pkgs; 
  [
    iosevka
    inter
    noto-fonts 
    noto-fonts-cjk-sans
    noto-fonts-color-emoji 
    lato liberation_ttf 
    open-sans roboto 
    ubuntu-classic 
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}