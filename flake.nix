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
         pc = lib.nixosSystem { 
            inherit system;
            modules = [ 
               ./configuration.nix 
            ];

            specialArgs = {
               hardware_config = ./hardware/pc/abf497471e334365af30cf48e20ed134.nix;
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
