{
  description = "My config yay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

    extendify = {
      url = "github:extendify-mod/extendify";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs@{ nixpkgs, nix-darwin, ... }:
    {
      nixosConfigurations.juice = nixpkgs.lib.nixosSystem {
        specialArgs =
          let
            user = "grape";
          in
          {
            inherit inputs user;

            system = "x86_64-linux";
            self = "/home/${user}/repos/juice";
            nvf = inputs.nvf.nixosModules.default;
          };

        modules = [
          ./modules/nixos
          ./modules/common
        ];
      };

      darwinConfigurations.juice = nix-darwin.lib.darwinSystem {
        specialArgs =
          let
            user = "apple";
          in
          {
            inherit inputs user;

            system = "aarch64-darwin";
            self = "/Users/${user}/repos/juice";
            nvf = inputs.nvf.darwinModules.default;
          };

        modules = [
          ./modules/darwin
          ./modules/common
        ];
      };
    };
}
