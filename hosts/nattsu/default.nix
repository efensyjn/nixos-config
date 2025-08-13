{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../picks
      ../../mods
    ];
  
  networking.hostName = "nattsu";

  time.timeZone = "Indian/Maldives";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    p7zip
  ];

  picks.neovim.enable = true;
  picks.git.enable = true;
  picks.nh.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };

  mods.nvidia.enable = false; 
  mods.xserver.enable = false;

  system.stateVersion = "25.05";
}