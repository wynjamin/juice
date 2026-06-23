{ ... }:

{
  imports = [
    ./hyprland.nix
    ./foot.nix
    ./fish.nix
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.firefox.enable = true;
}
