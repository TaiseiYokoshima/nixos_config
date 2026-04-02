{
   description = "My NixOS configuration flake";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      hyprland.url = "github:hyprwm/Hyprland";
      flake-parts.url = "github:hercules-ci/flake-parts";
      myUtils.url = "git+ssh://git@mgt/TaiseiYokoshima/nix_utils";
   };

   outputs =
      inputs:
      let
         getParts = inputs.myUtils.lib.getParts;
         normalizeDefault = inputs.myUtils.lib.normalizeDefault;
         filterFlakes = inputs.myUtils.lib.filterFlakes;


         collectFlakes = dirs: 
            filterFlakes
            (  normalizeDefault 
               (getParts dirs)
            )
         ;


         dirs = [
            ./hardware
            ./hosts
            ./modules
         ];
      in
      inputs.flake-parts.lib.mkFlake { inherit inputs; } {
         imports = collectFlakes dirs;
         systems = [ "x86_64-linux" "aarch64-linux"];
      };
}
