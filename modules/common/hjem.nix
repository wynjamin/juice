{
  inputs,
  lib,
  user,
  ...
}: {
  imports = [
    inputs.hjem.darwinModules.default
    (lib.modules.mkAliasOptionModule ["hj"] ["hjem" "users" user])
  ];

  hjem = {
    clobberByDefault = true;
    users.${user} = {
      enable = true;
      xdg = {
        config.files."autostart".type = "delete";
        data.files."applications".type = "delete";
      };
      files.".hushlogin".text = "";
    };
  };

  users.users.${user}.description = user;
}
