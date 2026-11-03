{pkgs, ...}: {
  imports = [
    ./programs
  ];

  nix.settings = {
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  fonts.packages = with pkgs; [nerd-fonts.fira-code];

  networking.hostName = "juice";
}
