{
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./git.nix
    ./neovim.nix
    ./fish.nix
  ];

  nixpkgs.config.allowUnfree = true;

  hj.packages = with pkgs; [
    vesktop
    inputs.mkshell.packages.${system}.default
    # inputs.extendify.packages.${system}.default
  ];
}
