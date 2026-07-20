{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      stateVersion = "26.05";

      mkHost = { hostname, userName, system ? "x86_64-linux" }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs userName stateVersion; };
          modules = [
            ./hosts/${hostname}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs userName stateVersion; };
              home-manager.users."${userName}" = import ./hosts/${hostname}/home.nix;
            }
          ];
        };
    in {
      nixosConfigurations = {
        desktop = mkHost { hostname = "desktop"; userName = "nix"; };
      };
    };
}