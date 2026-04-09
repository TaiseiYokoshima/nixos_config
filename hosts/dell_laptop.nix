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
      hardware.dell_laptop

      system
      nixpkgs
      nix-language
      bluetooth
      grub-4k
      boot
      boot
      programs
      packages
      services
      keyd
      locale
      users
      networking
      virtualisation
   ];
}
