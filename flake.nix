{
   description = "My NixOS configuration flake";

   inputs = {
      s-nixpkgs.url = "nixpkgs/nixos-26.05";
      u-nixpkgs.url = "nixpkgs/nixos-unstable";
      hyprland.url = "github:hyprwm/Hyprland";
      flake-parts.url = "github:hercules-ci/flake-parts";
      myUtils.url = "git+ssh://git@mgh/TaiseiYokoshima/nix_utils";
      home.url = "git+ssh://git@mgh/TaiseiYokoshima/home-manager";

      home-manager.url = "github:nix-community/home-manager/release-26.05";
      home-manager.inputs.nixpkgs.follows = "u-nixpkgs";

      dotfiles.url = "git+ssh://git@mgh/TaiseiYokoshima/.dotfiles?submodules=1";
   };

   outputs = inputs:
      let
         fetchModules = inputs.myUtils.lib.fetchModules;
         fetchConfigs = inputs.myUtils.lib.fetchConfigs;
      in
      {
         hardware = fetchModules ./hardware;
         modules = fetchModules ./modules;
         nixosConfigurations = fetchConfigs ./hosts inputs;
      };
}
