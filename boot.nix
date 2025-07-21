{ config, pkgs, ... }:
{
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

}
