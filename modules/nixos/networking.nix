{
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    25565
    8080
  ];
  networking.firewall.allowedUDPPorts = [ 25565 ];
}
