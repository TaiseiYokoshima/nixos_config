{ config, pkgs, lib, ... }:
let 
  dotfiles = pkgs.fetchFromGitHub {
    owner = "TaiseiYokoshima";
    repo = ".dotfiles";
    rev = "845bd63007b3121e84df41a1cf53d43b0cd14652";
    sha256 = "qOBXcL+JKdIPR+lxaAKqvY8rnl/xKOpKqRPWhRiLZDw=";
    fetchSubmodules = true;
  };
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";


  home.username = "rom";
  home.homeDirectory = "/home/rom";


  home.file = {
    ".config/alacritty".source = "${dotfiles}/alacritty";
    ".config/kitty".source = "${dotfiles}/kitty";
    ".config/wezterm".source = "${dotfiles}/wezterm";

    ".config/nvim".source = "${dotfiles}/nvim";
    ".config/fish".source = "${dotfiles}/fish";
    ".config/zellij".source = "${dotfiles}/zellij";
    ".config/tmux".source = "${dotfiles}/tmux";

    ".config/hypr".source = "${dotfiles}/hypr";
    ".config/sway".source = "${dotfiles}/sway";

    ".config/waybar".source = "${dotfiles}/waybar";
    ".config/rofi".source = "${dotfiles}/rofi";
    ".config/wallpapers".source = "${dotfiles}/wallpapers";
    ".config/scripts".source = "${dotfiles}/scripts";
    ".config/dunst".source = "${dotfiles}/dunst";
    ".config/fcitx5".source = "${dotfiles}/fcitx5";
  };

  imports = [
    # ./fonts.nix
    ./inputs.nix
    ./packages.nix
    ./gnome_apps.nix
  ];

}
