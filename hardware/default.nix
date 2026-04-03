{ inputs, ... }: {
   flake.nixosModules = inputs.myUtils.lib.grabNixosModules [./.] ./default.nix "hardware";

}
