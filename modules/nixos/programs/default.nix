_: {
  imports = [
    ./hyprland.nix
    ./foot.nix
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.firefox.enable = true;
}
