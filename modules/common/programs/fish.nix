{ pkgs, ... }:
let
  shellBin = "${pkgs.fish}/bin/fish";
in
{
  programs.fish.enable = true;

  hj = {
    xdg.config.files."fish/config.fish".text = /* fish */ ''
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

      # alias nix-switch="sudo nixos-rebuild switch --flake ${builtins.toString ../..}"
      # alias reboot="sudo reboot now"
    '';

    # files.".bashrc".text = /* bash */ ''
    #   if [[ -n "$\{IN_NIX_SHELL:-}" && $- == *i* && -z "$\{IN_FISH_FROM_NIX:-}" ]]; then
    #       if command -v fish >/dev/null 2>&1; then
    #           export IN_FISH_FROM_NIX=1
    #           exec ${shellBin}
    #       fi
    #   fi
    # '';
  };

  environment.variables = {
    SHELL = shellBin;
  };
}
