{
  pkgs,
  self,
  ...
}: {
  programs.hyprland.enable = true;

  hj = {
    packages = with pkgs; [
      fuzzel
      hyprshot
    ];

    xdg.config.files.hypr.source = "${self}/lua/hypr";
  };
}
