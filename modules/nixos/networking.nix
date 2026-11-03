_: {
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [
        25565
        8080
      ];
      allowedUDPPorts = [
        25565
        8080
      ];
    };
  };
}
