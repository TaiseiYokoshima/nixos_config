{pkgs, ...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bash
      zsh
      fish
      nushell

      coreutils
      git
      neovim
      nano
      curl
      wl-clipboard

      keyd

      home-manager

      gcc

      comma

      virt-manager
      qemu
      libvirt
      virt-viewer
    ];
  };
}
