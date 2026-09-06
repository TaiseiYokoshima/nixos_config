{ modules, ... }: {
   release = "stable";
   hardware = "vm";
   modules = with modules; [
      { system.stateVersion = "26.05"; }

      unstable-hyprland
      nixpkgs
      nix-language
      bluetooth
      grub-4k
      boot
      mullvad
      programs
      packages
      services
      locale
      users
      networking
      virtualisation
   ];
}
