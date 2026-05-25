{ pkgs, ... }:

{
    imports = [
        ./hardware
        ./programs

        ./boot.nix
        ./user.nix
        ./networking.nix
        ./locale.nix
        ./whitesur.nix
    ];
    nix.settings = {
        extra-experimental-features = [
            "nix-command"
            "flakes"
        ];
    };

    fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

    system.stateVersion = "25.11";
}
