{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.dell_laptop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
    };

    modules = [
      self.nixosModules.hardware_dell_laptop

      self.nixosModules.system
      self.nixosModules.nixpkgs
      self.nixosModules.nix-language

      self.nixosModules.bluetooth

      self.nixosModules.grub-4k
      self.nixosModules.boot
      self.nixosModules.boot
      self.nixosModules.programs
      self.nixosModules.packages
      self.nixosModules.services
      self.nixosModules.keyd
      self.nixosModules.locale
      self.nixosModules.users
      self.nixosModules.networking
      self.nixosModules.virtualisation
    ];
  };
}

