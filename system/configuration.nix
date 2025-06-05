{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./boot.nix
      ./users.nix
      ./programs.nix
      ./services.nix
      ./keyd.nix
      ./locale.nix
    ];


  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  environment.systemPackages = import ./packages { inherit pkgs; };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  system.stateVersion = "25.05";
}
