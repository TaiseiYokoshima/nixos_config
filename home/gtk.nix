{ config, pkgs, lib, ... }:
{

  # gtk.enable = true;
  # gtk.theme.name = "Adwaita-dark";
  # home.sessionVariables.GTK_THEME = "Adwaita-dark"; 
  # gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  # gtk.gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;



  # programs.dconf.enable = true;
  # programs.dconf.profiles.user = {
  #  databases = [{
  #    settings = {
  #      "org/gnome/desktop/interface" = {
  #        color-scheme = "prefer-dark";
  #        clock-format = "24h";
  #        clock-show-weekday = true;
  #      };
  #    };
  #  }];
  # };
  # services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
  #  [org.gnome.mutter]
  #  check-alive-timeout=60000
  # '';


  # home.activation.setDarkMode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
  # '';
}
