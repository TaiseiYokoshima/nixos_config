{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      hyprland.url = "github:hyprwm/Hyprland";
      nix-index-database = {
         url = "github:nix-community/nix-index-database";
         inputs.nixpkgs.follows = "nixpkgs";
      };

      flake-parts.url = "github:hercules-ci/flake-parts";
      import-tree.url = "github:vic/import-tree";
   };

   outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./parts);
}
