{
  imports = [
    ../common/locale.nix
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
