{ inputs, pkgs, ... }:
let
   unstable = import inputs.nixpkgs {
      system = pkgs.system;
   };
in
{
   programs.hyprland = {
      enable = true;
      package = unstable.hyprland;
      portalPackage = unstable.xdg-desktop-portal-hyprland;
   };
}
