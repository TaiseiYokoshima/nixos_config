{
   inputs,
   self,
   hardware,
   modules,
   ...
}:
inputs.nixpkgs.lib.nixosSystem {
   specialArgs = {
      inherit inputs self hardware modules;
   };

   modules = [
      ./pc.nix
   ];
}
