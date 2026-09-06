{ u-pkgs, ... }:
{
   programs.hyprland = {
      enable = true;
      package = u-pkgs.hyprland;
      portalPackage = u-pkgs.xdg-desktop-portal-hyprland;
   };
}
