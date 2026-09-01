inputs:
inputs.s-nixpkgs.lib.nixosSystem {
   specialArgs = { inherit inputs; };
   modules = [
      ./vm.nix
   ];
}
