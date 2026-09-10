{
  inputs,
  user,
  lib,
  ...
}:

{
  imports = [
    inputs.hjem.darwinModules.default
    (lib.modules.mkAliasOptionModule [ "hj" ] [ "hjem" "users" user ])
  ];

  system.primaryUser = user;
  hjem = {
    clobberByDefault = true;
    users.${user} = {
      enable = true;
      files.".hushlogin".text = "";
    };
  };

  users.users.${user} = {
    description = user;
    home = "/Users/${user}";
  };
}
