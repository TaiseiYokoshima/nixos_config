{ config, pkgs, hardware_config, ... }:
{
   imports = [
      hardware_config
      ./boot.nix
      ./programs.nix
      ./packages.nix
      ./services.nix
      ./keyd.nix
      ./locale.nix
      ./users.nix
      ./networking.nix
      ./virtualization.nix


      # ./comma_command.nix
   ];

   nixpkgs.config.allowUnfree = true;
   nix.settings.experimental-features = [ "nix-command" "flakes"];
   system.stateVersion = "25.05";
}
