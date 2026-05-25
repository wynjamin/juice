{
  description = "My config yay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/x86_64-linux";

    hjem = {
      url = "github:feel-co/hjem";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nix-darwin.follows = "";
      };
    };

    nvim-config = {
      url = "github:7elia/nvim";
      flake = false;
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-compat.follows = "";
        ndg.follows = "";
      };
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
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
    inputs@{ nixpkgs, ... }:
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
          };

        modules = [
          ./modules
        ];
      };
    };
}
