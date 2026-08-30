{ pkgs, ... }: {
   boot.kernelModules = [
      "kvm-intel"
      "kvm-amd"
   ];

   virtualisation = {
      docker.enable = true;

      libvirtd = {
         enable = true;
         qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true; # Habilita TPM virtual (necesario para Windows 11)
         };
         # qemu.networks.default.forwardMode = "bridge";
      };
   };

   users.users.rom.extraGroups = [ "libvirtd" ];
}
