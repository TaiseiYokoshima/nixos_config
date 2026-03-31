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

  outputs = inputs: let
    collectFlakes = import ./utils/get-parts.nix {};
    dirs = [
      ./hardware
      ./hosts
      ./modules
    ];
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = collectFlakes dirs;
    };
}
