{ inputs, pkgs, ... }:
let
   unstable = import inputs.u-nixpkgs {
      system = pkgs.stdenv.hostPlatform.system;
   };
in
{
   programs.hyprland = {
      enable = true;
      package = unstable.hyprland;
      portalPackage = unstable.xdg-desktop-portal-hyprland;
   };
}
