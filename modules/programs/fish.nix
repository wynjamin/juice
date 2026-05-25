{
  programs.fish.enable = true;

  programs.bash.interactiveShellInit = /* sh */ ''
    if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
      exec fish
    fi
  '';

  hj.xdg.config.files."fish/config.fish".text = /* fish */ ''
    set fish_greeting

    functions -c fish_prompt _prompt
    function fish_prompt
      if set -q IN_NIX_SHELL
        echo -n "(nix) "
      end
      _prompt
    end

    set -g fish_prompt_pwd_dir_length -1

    alias nix-switch="sudo nixos-rebuild switch --flake ${builtins.toString ../..}"
    alias reboot="sudo reboot now"
  '';

  environment.sessionVariables = {
    SHELL = "fish";
  };
}
