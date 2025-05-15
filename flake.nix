{
  description = "Zemy OS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      zemy-os = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/zemy-os
        ];
      };
    };
  };
}
