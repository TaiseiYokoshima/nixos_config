{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      hyprland.url = "github:hyprwm/Hyprland";
      flake-parts.url = "github:hercules-ci/flake-parts";
      myUtils.url = "git+ssh://git@mgt/TaiseiYokoshima/nix_utils";
   };

   outputs =
      inputs@{ self, ... }:
      let
         fetchModules = inputs.myUtils.lib.fetchModules;
         hardware = fetchModules ./hardware;
         modules = fetchModules ./modules;
      in
      {
         inherit hardware modules;

         nixosConfigurations.pc = import ./hosts/pc.nix { inherit self inputs hardware modules; };
         nixosConfigurations.dell_laptop = import ./hosts/dell_laptop.nix { inherit self inputs hardware modules; };
      };
}
