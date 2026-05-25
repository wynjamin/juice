{
  pkgs,
  inputs,
  system,
  ...
}:

{
  imports = [
    ./git.nix
    ./neovim.nix
    ./hyprland.nix
    ./foot.nix
    ./fish.nix
  ];

  nixpkgs.config.allowUnfree = true;

  hj.packages = with pkgs; [
    vesktop
    inputs.extendify.packages.${system}.default
  ];

  programs.firefox.enable = true;
}
