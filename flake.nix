{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    hyprland.url = "github:hyprwm/Hyprland";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs: let
    collectFlakes = import ./utils/get-parts.nix {};
    dirs = [
      ./hardware
      ./hosts
      ./modules
    ];
  in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = collectFlakes dirs;
    };
}
