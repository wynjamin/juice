{ inputs, user, lib, pkgs, ... }:

{
    imports = [
        inputs.hjem.nixosModules.default
        (lib.modules.mkAliasOptionModule [ "hj" ] [ "hjem" "users" user ])
    ];

    hjem = {
        clobberByDefault = true;
        users.${user} = {
            enable = true;
            xdg = {
                config.files."autostart".type = "delete";
	            data.files."applications".type = "delete";
            };
        };
    };

    users = {
        defaultUserShell = pkgs.fish;

        users.${user} = {
            isNormalUser = true;
            description = user;
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
