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

  time.timeZone = "Europe/London";
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

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    # enable = false;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];


  #   fcitx5.settings = {
  #     inputMethod = {
  #       "Groups/0" = {
  #         "Name" = "Default";
  #         "Default Layout" = "us";
  #         "DefaultIM" = "keyboard-us";
  #       };
  #
  #       "Groups/0/Items/0" = {
  #         "Name" = "keybord-us";
  #         "Layout" = "us";
  #       };
  #
  #       "Groups/0/Items/1" = {
  #         "Name" = "mozc";
  #         "Layout" = null;
  #       };
  #
  #       "GroupOrder" = {
  #         "0" = "Default";
  #       };
  #     };
  #
  #     globalOptions = {
  #       "Hotkey/TriggerKeys" = {
  #         "0" = "Super+Escape";
  #       };
  #     };
  # 
  #   };

  };

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
    hyprland
    waybar
    alacritty
    kitty
    rofi
    nodejs
    nodePackages.npm
    ripgrep
    gcc
    stow
    git
    neovim
    fish
    python3
    python3Packages.pip
    unzip
    clang-tools
    libinput 
    wev
    keyd
    efibootmgr
    wl-clipboard
    bash
    swaynotificationcenter
    pulseaudio
    libnotify
    brightnessctl
    blueman
    hyprpaper
    bibata-cursors
    eza
    home-manager

    grim
    slurp

    # flameshot
    # grimblast
    # sway-contrib.grimshot
  ];



  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts-cjk-sans
  ];



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
