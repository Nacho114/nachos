{
  description = "NachOS";

  inputs = {
    # Where I'm pulling from
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    # use the same version of nixpkgs for Home Manager as for rest of the system
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations.nachos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./configuration.nix ];
    };

    homeConfigurations.nacho = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home/home.nix ];
    };
  };
}
