{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles.url = "git+https://github.com/TaiseiYokoshima/.dotfiles?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... }: 

  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in 
  {
    

    homeConfigurations = {
      rom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit dotfiles;
        };
      };
    };



  };

}
