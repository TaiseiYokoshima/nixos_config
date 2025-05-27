{ config, pkgs, ... }:

{
  home.username = "rom";
  home.homeDirectory = "/home/rom";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

}
