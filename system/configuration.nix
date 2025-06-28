{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./boot.nix
      ./programs.nix
      ./services.nix
      ./keyd.nix
      ./locale.nix
    ];

  users.users.rom = import ./users.nix { inherit pkgs; };
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  
  programs.nix-ld.enable = true;


  # programs.command-not-found.enable = false;
  #
  # programs.nix-index = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   enableZshIntegration = true;
  #   enableFishIntegration = true;
  # };
  

  virtualisation.docker.enable = true;


  system.stateVersion = "25.05";



  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts-cjk-sans
  ];


}
