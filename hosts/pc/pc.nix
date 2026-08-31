{
   hardware,
   modules,
   ...
}:
{
   system.stateVersion = "26.05"; 

   imports = with modules; [
      hardware.pc

      unstable-hyprland

      nixpkgs
      nix-language
      bluetooth
      grub-4k
      boot
      mullvad
      programs
      packages
      services
      locale
      users
      networking
      virtualisation
   ];
}
