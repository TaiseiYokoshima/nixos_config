{ config, pkgs, ... }:
{
   boot.loader = {
      efi.canTouchEfiVariables = true;

      timeout = 5;

      systemd-boot = {
         enable = true;
         configurationLimit = null;
         consoleMode = "max";
      };

      grub = {
         efiSupport = true;
         device = "nodev";

         useOSProber = true;
         default = "saved";

         extraConfig = ''
            GRUB_DEFAULT=saved
            GRUB_SAVEDEFAULT=true
         '';

         extraEntries = ''
            menuentry "UEFI" {
              fwsetup
            }
         '';
      };

   };
}
