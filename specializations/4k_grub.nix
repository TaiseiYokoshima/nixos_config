{ lib, ...}:{


   boot.loader.systemd-boot.enable = lib.mkForce false;
   boot.loader.grub.enable = lib.mkForce true;

   boot.loader.systemd-boot.consoleMode = lib.mkForce "max";

   boot.loader.grub.gfxmodeEfi =  "1600x1200x32,auto";
   boot.loader.grub.gfxmodeBios = "1600x1200x32,auto";
}
