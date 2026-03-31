{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      hyprland.url = "github:hyprwm/Hyprland";
      nix-index-database = {
         url = "github:nix-community/nix-index-database";
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };


   outputs = { nixpkgs, nix-index-database, ... } @inputs : 
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
               specialArgs = {
                  inherit inputs;
               };
               inherit system;
               modules = [
                  ./configuration.nix
                  ./entries/pc
               ];
            };
         };
      };
}
