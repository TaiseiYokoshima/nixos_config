{ config, pkgs, 
# dotfiles, 
... 
}:
let 
  dotfiles = /home/rom/nixos_config/dotfiles;
in
{
  home.username = "rom";
  home.homeDirectory = "/home/rom";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.file = {
      ".config/alacritty".source = "${dotfiles}/alacritty";
  };


}
