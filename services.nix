{ pkgs, ... }:
{
   services.flatpak.enable = true;
   services.fwupd.enable = true;

   services.displayManager.gdm.enable = true;
   services.desktopManager.gnome.enable = true;

   services.pulseaudio.enable = false;
   security.rtkit.enable = true;

   services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
   };

   xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
         xdg-desktop-portal-wlr
      ];
   };




   services.power-profiles-daemon.enable = true;
   services.upower.enable = true;


}
