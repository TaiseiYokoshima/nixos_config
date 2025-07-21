{ pkgs, ... }:
{
   users.users.rom = {
      isNormalUser = true;
      description = "rom";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.fish;
   };
}
