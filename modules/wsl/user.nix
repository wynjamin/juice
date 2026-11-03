{
  user,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hjem.nixosModules.default
    ../common/hjem.nix
  ];

  users = {
    defaultUserShell = pkgs.fish;

    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      useDefaultShell = true;
    };
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_STATE_HOME = "$HOME/.local/state";
  };
}
