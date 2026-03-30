{ inputs, pkgs, ... }:
{
   programs.fish.enable = true;
   programs.zsh.enable = true;

   programs.dconf.enable = true;

   programs.nix-ld.enable = true;


  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
