{...}: {
  imports = [
    ./hardware
    ./programs

    ./boot.nix
    ./user.nix
    ./networking.nix
    ./locale.nix
    ./whitesur.nix
  ];

  system.stateVersion = "25.11";
}
