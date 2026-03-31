{...}: {
  flake.nixosModules.system = {...}: {
    system.stateVersion = "25.05";
  };
}
