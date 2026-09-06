{ modules, ... }:
{
   system = "x86_64-linux";
   modules = with modules; [
      live
      unstable-hyprland
      nixpkgs
      nix-language
      bluetooth
      mullvad
      programs
      packages
      services
      locale
      users
      networking
   ];
}
