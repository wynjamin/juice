{pkgs, ...}: let
  shellBin = "${pkgs.fish}/bin/fish";
in {
  programs.fish.enable = true;

  hj = {
    xdg.config.files."fish/config.fish".text =
      /*
      fish
      */
      ''
        set fish_greeting

        fish_add_path ~/.local/bin

        functions -c fish_prompt _prompt
        function fish_prompt
          if set -q IN_NIX_SHELL
            echo -n "(nix) "
          end
          _prompt
        end

        set -g fish_prompt_pwd_dir_length -1

        alias nix-shell="nix-shell --command ${shellBin}"
      '';
  };

  environment.variables = {
    SHELL = shellBin;
  };
}
