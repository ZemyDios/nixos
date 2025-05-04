{
    description = "Zemy OS";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.11";

        home-manager = { 
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { 
        self, 
        nixpkgs,
        home-manager,
        ... 
    }: let
    
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        
    in {
        nixosConfigurations = {
            zemy-os = lib.nixosSystem {
                modules = [ ./configuration.nix ];
            };
        };
        homeConfigurations = {
            zemy = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home.nix ];
            };
        };
    };
}