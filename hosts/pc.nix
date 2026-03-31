{
  inputs,
  self,
  ...
}: {
  systems = ["x86_64-linux"];

  flake.nixosConfigurations.pc = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
    };

    modules = [
      self.nixosModules.pc

      self.nixosModules.system
      self.nixosModules.nixpkgs
      self.nixosModules.nix_language

      self.nixosModules.bluetooth

      self.nixosModules.grub_4k
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
      self.nixosModules.comma_command
    ];
  };
}
