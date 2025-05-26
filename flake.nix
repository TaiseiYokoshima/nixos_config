{
  description = "My NixOS configuration flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs, ... }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
