{ pkgs, lib, ... }:

{
  imports = [
    ./programs

    ./user.nix
  ];

  nix.settings = {
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

  system.stateVersion = 6;
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
}
