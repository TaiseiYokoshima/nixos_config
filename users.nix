{ pkgs, ... }:
{
   users.users.rom = {
      isNormalUser = true;
      description = "rom";
      extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "libvirtd" ];
      shell = pkgs.fish;
   };
}
