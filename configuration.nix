{ config, pkgs, cpu, ... }:
let 
   hardwareConfigFile = if cpu == "intel" then ./hardware/intel-hardware-configuration.nix
                     else if cpu == "amd" then ./hardware/amd-hardware-configuration.nix
                     else throw "Unknown cpu: ${cpu}";
in
{
   imports = [
      hardwareConfigFile
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
