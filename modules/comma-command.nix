{inputs, ...}: {
  flake.nixosModules.comma_command = {...}: {
    programs.nix-index-database.comma.enable = true;
    imports = [
      inputs.nix-index-database.nixosModules.default
    ];
  };
}
