{ pkgs }:

with pkgs; [
# shells
  bash
  zsh
  fish
  nushell


# other cli tools
  coreutils
  git
  neovim
  curl
  wl-clipboard


# remapper
  keyd

  home-manager
  flatpak

  gcc 
  # tree-sitter


  nix-index
  # nix-index-database
  comma
]
