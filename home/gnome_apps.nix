{ config, pkgs, lib, ... }:
{

  home.activation.setGnomeDarkMode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface clock-format '24h'
    ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface clock-show-weekday true
  '';
}
