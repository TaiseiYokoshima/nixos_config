{
   inputs,
   self,
   hardware,
   modules,
   ...
}:
inputs.nixpkgs.lib.nixosSystem {
   specialArgs = {
      inherit inputs self modules;
   };

   modules = with modules; [
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
