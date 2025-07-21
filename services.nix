{ config, ... }:
{
   services.flatpak.enable = true;
   services.fwupd.enable = true;

   services.xserver.displayManager.gdm.enable = true;
   services.xserver.desktopManager.gnome.enable = true;


   services.pulseaudio.enable = false;
   security.rtkit.enable = true;
   services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
   };
}
