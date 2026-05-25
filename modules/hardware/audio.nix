{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hj.packages = with pkgs; [ pwvucontrol ];
}
