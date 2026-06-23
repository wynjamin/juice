{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  nixpkgs.config.allowUnfree = true;

  hj.packages = with pkgs; [
    vesktop
    # inputs.extendify.packages.${system}.default
  ];
}
