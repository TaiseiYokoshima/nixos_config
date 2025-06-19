{ config, pkgs, nvim_wrapped, unstable, ... }:
{

  home.packages = (with pkgs; [
    bash 
    zsh
    fish 
    nushell

    git
    # neovim
    # nvim_wrapped.packages.default
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

    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans


    zellij
    tmux

    fzf
    bat

    wezterm

  ]) ++ (with unstable; [
    # wezterm
  ]);

}
