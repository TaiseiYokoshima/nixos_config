{ inputs, pkgs, modulesPath, lib, ... }:
let
   modules = inputs.self.modules;
   hardware = inputs.self.hardware;
in
{
   system.stateVersion = "26.05";



   systemd.services.populate-user-config = {
      description = "Populate live user configuration";

      wantedBy = [ "multi-user.target" ];
      after = [ "systemd-user-sessions.service" ];

      serviceConfig = {
         Type = "oneshot";
         RemainAfterExist = true;
      };

      script = ''
         rm -rf /home/rom/.dotfiles
         mkdir -p /home/rom/.dotfiles
         mkdir -p /home/rom/.config
         cp -R ${inputs.dotfiles}/. /home/rom/.dotfiles/

         chown -R rom:users /home/rom/.dotfiles
         chown -R rom:users /home/rom/.config

         sudo -u rom HOME=/home/rom /home/rom/.dotfiles/link_all.bash
      '';
   };

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

      # hardware.pc

      "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"

      unstable-hyprland

      nixpkgs
      nix-language
      bluetooth
      mullvad
      programs
      packages
      services
      locale
      users
      networking
   ];
}

