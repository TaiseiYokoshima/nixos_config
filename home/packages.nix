{ config, pkgs, nvim_wrapped, unstable, ... }:
{

  home.packages = (with pkgs; [
    bash 
    zsh
    fish 
    nushell

    git
    nvim_wrapped.packages."x86_64-linux".default
    wl-clipboard
    curl
    
    gcc
  
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
    nodejs


    wev
    pulseaudio
    unzip
    swaynotificationcenter
    brightnessctl
    hyprpaper

    # hyprland
    waybar
    rofi

    alacritty
    kitty
    ghostty
    wezterm

    zellij
    tmux

    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans



    fzf
    bat



   playerctl

  ]) ++ (with unstable; [
    # wezterm
  ]);

}
