{ config, inputs, pkgs, modulesPath, lib, ... }:
let
   modules = inputs.self.modules;
   hardware = inputs.self.hardware;
in
{
   system.stateVersion = "26.05";

   users.users.nixos.enable = lib.mkForce false;
   users.users.rom = {
      initialPassword = lib.mkForce "1234";
      extraGroups = lib.mkForce [
         "networkmanager"
         "wheel"
         "docker"
         "kvm"
         "libvirtd"
         "video"
      ];
   };
   users.users.root.initialHashedPassword = lib.mkForce "";

   services.getty.autologinUser = lib.mkForce null;
   services.displayManager.autoLogin = {
      enable = lib.mkForce false;
      user = lib.mkForce null;
   };
   services.displayManager.defaultSession = lib.mkForce "hyprland";
   services.getty.helpLine = lib.mkForce (
      ''
         The "rom" account password is "1234".
         The "root" account has an empty password.

         To log in over ssh as root you must set a root password with
         `sudo passwd root`, or add your public key to
         /home/rom/.ssh/authorized_keys or /root/.ssh/authorized_keys.

         To set up a wireless connection, run `nmtui`.
      ''
      + lib.optionalString config.services.xserver.enable ''

         Type `sudo systemctl start display-manager' to
         start the graphical user interface.
      ''
   );

   nix.settings.trusted-users = lib.mkForce [ "rom" ];

   boot.postBootCommands = lib.mkAfter ''
      for o in $(</proc/cmdline); do
         case "$o" in
            live.rom.passwd=*)
               set -- $(IFS==; echo $o)
               echo "rom:$2" | ${pkgs.shadow}/bin/chpasswd
               ;;
         esac
      done
   '';

   systemd.services.populate-user-config = {
      description = "Populate live user configuration";

      wantedBy = [ "multi-user.target" ];
      after = [ "systemd-user-sessions.service" ];
      path = with pkgs; [
         bash
         coreutils
         util-linux
      ];

      serviceConfig = {
         Type = "oneshot";
         RemainAfterExit = true;
      };

      script = ''
         install -d -m 0755 -o rom -g users /home/rom
         rm -rf /home/rom/.dotfiles
         install -d -m 0755 -o rom -g users /home/rom/.dotfiles /home/rom/.config
         cp -R --no-preserve=mode,ownership ${inputs.dotfiles}/. /home/rom/.dotfiles/

         chown -R rom:users /home/rom/.dotfiles
         chown -R rom:users /home/rom/.config
         chmod -R u+rwX /home/rom/.dotfiles /home/rom/.config

         rm /home/rom/.config/fish -rf

         runuser -u rom -- env HOME=/home/rom bash -lc 'cd "$HOME" && bash "$HOME/.dotfiles/link_all.bash"'
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

      "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"

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
