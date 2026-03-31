{ inputs, self, ... }: {

   systems = [ "x86_64-linux" ];

   flake.nixosConfigurations.pc = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
         inherit inputs self;
      };

      modules = [
         self.nixosModules.grub_4k
         self.nixosModules.pc
         self.nixosModules.boot
      ];
   };
}
