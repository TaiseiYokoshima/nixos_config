{ config, pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    bash 
    zsh
    fish 
    nushell

    git
    neovim
    wl-clipboard
    curl
    
  
    dconf
    grim
    slurp

    eza
    rustup 

    bibata-cursors
    blueman
    libnotify

    python3
    python3Packages.pip
    wev
    pulseaudio
    unzip
    swaynotificationcenter
    brightnessctl
    hyprpaper

    hyprland
    waybar
    alacritty
    kitty
    rofi


    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans

  ];

}
