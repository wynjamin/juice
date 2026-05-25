{
  pkgs,
  lib,
  inputs,
  system,
  ...
}:
let
  launchSession = pkgs.writeShellApplication {
    name = "launch-session";

    runtimeInputs = [
      inputs.hyprland.packages.${system}.hyprland
    ];

    bashOptions = [
      "errexit"
      "pipefail"
    ];

    text = /* sh */ ''
      if [ "$XDG_VTNR" -eq 1 ] && [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
          start-hyprland
      fi
    '';
  };
in
{
  environment.systemPackages = with pkgs; [ sbctl ];

  boot.loader.limine = {
    enable = true;
    extraEntries = ''
      /Windows
          protocol: efi-chainload
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.loginShellInit = lib.meta.getExe launchSession;
}
