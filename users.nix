{ pkgs }:
{
  isNormalUser = true;
  description = "rom";
  extraGroups = [ "networkmanager" "wheel" "docker" ];
  shell = pkgs.fish;

}
