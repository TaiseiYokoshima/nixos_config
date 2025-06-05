{ config, ... }:
{
  users.users.rom = {
    isNormalUser = true;
    description = "rom";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };
}
