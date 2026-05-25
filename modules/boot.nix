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
      /Windows/
          protocol: efi
          path: guid(db8fa3b1-2ca6-43cc-92ea-b915a011ef28):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.loginShellInit = lib.meta.getExe launchSession;
}
