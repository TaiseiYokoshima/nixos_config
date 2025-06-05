{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";

      useOSProber = true;
      default = "saved";
      extraConfig = "GRUB_DEFAULT=saved\nGRUB_SAVEDEFAULT=true";
      extraEntries = ''
        menuentry "UEFI" {
          fwsetup
        }
      '';
    };
  };



  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  programs.hyprland.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  programs.fish.enable = true;

  users.users.rom = {
    isNormalUser = true;
    description = "rom";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };


  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bash
    zsh
    fish
    nushell


    coreutils
    git
    neovim
    curl
    net-tools
    wl-clipboard



    keyd



    home-manager
    flatpak

    
  ];


  programs.dconf.enable = true;




  systemd.services.keyd = {
    description = "keyd keyboard remapping daemon";
    wantedBy = [ "multi-user.target"];

    serviceConfig = {
        ExecStart = "${pkgs.keyd}/bin/keyd";
        Restart = "on-failure";
    };
  };


  environment.etc."keyd/default.conf".source = ./default.conf;


  nix.settings.experimental-features = [ "nix-command" "flakes"];


  system.stateVersion = "25.05";
}
