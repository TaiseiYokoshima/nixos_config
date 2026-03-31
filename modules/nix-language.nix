{...}: {
  flake.nixosModules.nix_language = {...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
