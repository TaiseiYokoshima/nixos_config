{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
   };


   outputs = { self, nixpkgs, home-manager, ... }: 
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
            ];
            specialArgs = {
               hardwarePath = ./hardware/dell_laptop/afb403a99e904bc996fd65ebfb69c9f6.nix;
            };
         };



         intel = lib.nixosSystem {
            inherit system;
            modules = [ 
               ./configuration.nix 
            ];
            specialArgs = {
               cpu = "intel";
            };
         };

         amd = lib.nixosSystem {
            inherit system;
            modules = [ 
               ./configuration.nix 
            ];
            specialArgs = {
               cpu = "amd";
            };
         };



      };


   };
}
