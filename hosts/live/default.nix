inputs:
inputs.s-nixpkgs.lib.nixosSystem {
   system = "x86_64-linux";
   specialArgs = { inherit inputs; };
   modules = [
      ./live.nix
   ];
}
