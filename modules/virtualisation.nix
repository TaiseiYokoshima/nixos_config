{...}: {
  flake.nixosModules.virtualisation = {...}: {
    virtualisation = {
      docker.enable = true;

      libvirtd = {
        enable = true;
        # qemu.networks.default.forwardMode = "bridge";
      };
    };
  };
}
