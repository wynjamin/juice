{pkgs, ...}: {
  hj = {
    packages = with pkgs; [ghostty-bin];

    xdg.config.files."ghostty/config.ghostty".text = ''
      command = ${pkgs.fish}/bin/fish
    '';
  };
}
