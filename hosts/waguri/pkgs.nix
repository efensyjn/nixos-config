{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # Utility
    p7zip
    docker-compose
    vscodium

    # Gaming
    rpcs3

    # Security
    cryptomator
    keepassxc
  ];
}