{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
      # shells
      bash
      zsh
      fish
      nushell


      # other cli tools
      coreutils
      git
      neovim
      nano
      curl
      wl-clipboard


      # remapper
      keyd

      home-manager

      gcc 


      # nix-index
      # nix-index-database
      comma
   ];
}
