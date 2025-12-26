{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
   };

   outputs = { nixpkgs, ... }:
      let
         lib = nixpkgs.lib;
         system = "x86_64-linux";
         pkgs = nixpkgs.legacyPackages.${system};
      in
      {

         nixosConfigurations = {
            dell_laptop = lib.nixosSystem {
               inherit system;
               modules = [
                  ./configuration.nix
                  ./entries/dell_laptop
               ];
            };

            pc = lib.nixosSystem {
               inherit system;
               modules = [
                  ./configuration.nix
                  ./entries/pc
               ];
            };

            nixos = lib.nixosSystem {
               inherit system;
               modules = [
                  ./configuration.nix
                  ./entries/nixos
               ];
            };



         };
      };
}
