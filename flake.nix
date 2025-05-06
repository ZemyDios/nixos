{
    description = "Zemy OS";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.11";

        home-manager = { 
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { 
        self, 
        nixpkgs,
        home-manager,
        ... 
    }: {
        nixosConfigurations = {
            zemy-os = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [ ./configuration.nix ];
            };
        };

        homeConfigurations = {
            zemy = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                modules = [ ./home.nix ];
            };
        };
    };
}