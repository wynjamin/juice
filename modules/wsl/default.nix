{user, ...}: {
  imports = [
    ../common/locale.nix
    ./user.nix
    ./hardware-configuration.nix
  ];

  wsl = {
    enable = true;
    defaultUser = user;
  };

  system.stateVersion = "26.05";
}
