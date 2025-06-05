{ pkgs }:
{
  isNormalUser = true;
  description = "rom";
  extraGroups = [ "networkmanager" "wheel" ];
  shell = pkgs.fish;
}
