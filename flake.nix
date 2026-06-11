{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-26.05";
      unstable.url = "nixpkgs/nixos-unstable";
      hyprland.url = "github:hyprwm/Hyprland";
      flake-parts.url = "github:hercules-ci/flake-parts";
      myUtils.url = "git+ssh://git@mgt/TaiseiYokoshima/nix_utils";
   };

   outputs =
      inputs@{ self, ... }:
      let
         fetchModules = inputs.myUtils.lib.fetchModules;
         fetchConfigs = inputs.myUtils.lib.fetchConfigs;
         hardware = fetchModules ./hardware;
         modules = fetchModules ./modules;
      in
      {
         inherit hardware modules;

         nixosConfigurations = fetchConfigs ./hosts {
            inherit
               self
               inputs
               hardware
               modules
               ;
         };
      };
}
