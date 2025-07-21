{ config, pkgs, ... }:
{
   imports = [
      ./hardware-configuration.nix
      ./boot.nix
      ./programs.nix
      ./packages.nix
      ./services.nix
      ./keyd.nix
      ./locale.nix
      ./users.nix
      ./networking.nix
      ./virtualization.nix
   ];

   nixpkgs.config.allowUnfree = true;
   nix.settings.experimental-features = [ "nix-command" "flakes"];
   system.stateVersion = "25.05";

   # programs.command-not-found.enable = false;
   # programs.nix-index = {
   #   enable = true;
   #   enableBashIntegration = true;
   #   enableZshIntegration = true;
   #   enableFishIntegration = true;
   # };
}
