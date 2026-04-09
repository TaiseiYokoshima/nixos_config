{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      hyprland.url = "github:hyprwm/Hyprland";
      flake-parts.url = "github:hercules-ci/flake-parts";
      myUtils.url = "git+ssh://git@mgt/TaiseiYokoshima/nix_utils";
   };

   outputs = inputs @ { self, ... }: {
      os-modules.boot = import ./modules/boot.nix;
      hardware.dell_laptop = import ./hardware/dell_laptop.nix;
      os-modules.test = import ./modules/test;

     nixosConfigurations.dell_laptop = inputs.nixpkgs.lib.nixosSystem {
       specialArgs = {
         inherit inputs self;
       };

       modules = [
         self.hardware.dell_laptop
         self.os-modules.boot
         self.os-modules.test
       ];
     };





      
   };
}
