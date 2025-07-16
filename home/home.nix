{ config, pkgs, lib, dotfiles, nvim_wrapped, ... }:
{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";


  home.username = "rom";
  home.homeDirectory = "/home/rom";



  home.sessionPath = [
    "$HOME/.local/bin"
  ];




  imports = [
    ./inputs.nix
    ./packages.nix
    ./gnome_apps.nix
  ];


}
