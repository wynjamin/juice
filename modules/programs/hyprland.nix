{
  inputs,
  pkgs,
  self,
  system,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };

  hj = {
    packages = with pkgs; [
      fuzzel
      hyprshot
    ];

    xdg.config.files.hypr.source = "${self}/lua/hypr";
  };
}
