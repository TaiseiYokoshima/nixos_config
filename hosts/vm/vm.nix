{ inputs, pkgs, ... }:
let
   modules = inputs.self.modules;
   hardware = inputs.self.hardware;
in
{
   system.stateVersion = "26.05";

   imports = with modules; [
      inputs.home-manager.nixosModules.home-manager

      {
         home-manager.extraSpecialArgs = {
            inputs = inputs // inputs.home.inputs;
            modules = inputs.home.modules;
            u-pkgs = import inputs.u-nixpkgs { system = pkgs.stdenv.hostPlatform.system; config.allowUnfree = true; };
         };

         home-manager.users.rom = {
            imports = [
               (inputs.home.outPath + "/entries/general/general.nix")
            ];
         };
      }

      hardware.pc

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

