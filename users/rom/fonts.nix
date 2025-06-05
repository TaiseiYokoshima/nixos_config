{ config, pkgs, lib, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans
  ];
}
