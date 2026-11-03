{pkgs, ...}: let
  cursorPackage = pkgs.whitesur-cursors;
in {
  hj.packages = with pkgs; [
    whitesur-icon-theme
    whitesur-gtk-theme
    cursorPackage
  ];

  environment.sessionVariables = let
    size = 24;
  in {
    HYPRCURSOR_SIZE = size;
    XCURSOR_SIZE = size;
    XCURSOR_THEME = "WhiteSur-cursors";
    XCURSOR_PATH = ["${cursorPackage}/share/icons"];
  };
}
