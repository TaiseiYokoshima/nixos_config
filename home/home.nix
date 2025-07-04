{ config, pkgs, lib, dotfiles, nvim_wrapped, ... }:
{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";


  home.username = "rom";
  home.homeDirectory = "/home/rom";



  home.sessionPath = [
    "$HOME/.local/bin"
  ];



  # home.file = {
  #   ".config/alacritty".source   = dotfiles.outputs.alacritty;
  #   ".config/kitty".source       = dotfiles.outputs.kitty;
  #   ".config/wezterm".source     = dotfiles.outputs.wezterm;
  #
  #   ".config/nvim".source        = dotfiles.outputs.nvim;
  #   ".config/fish".source        = dotfiles.outputs.fish;
  #   ".config/zellij".source      = dotfiles.outputs.zellij;
  #   ".config/tmux".source        = dotfiles.outputs.tmux;
  #
  #   ".config/hypr".source        = dotfiles.outputs.hypr;
  #   ".config/sway".source        = dotfiles.outputs.sway;
  #
  #   ".config/waybar".source      = dotfiles.outputs.waybar;
  #   ".config/rofi".source        = dotfiles.outputs.rofi;
  #   ".config/wallpapers".source  = dotfiles.outputs.wallpapers;
  #   ".config/scripts".source     = dotfiles.outputs.scripts;
  #   ".config/dunst".source       = dotfiles.outputs.dunst;
  #   ".config/fcitx5".source      = dotfiles.outputs.fcitx5;
  # };

  imports = [
    # ({config, pkgs, nvim_wrapped, ...}: import ./inputs.nix { inherit pkgs config nvim_wrapped lib; })
    ./inputs.nix
    ./packages.nix
    ./gnome_apps.nix
  ];


}
