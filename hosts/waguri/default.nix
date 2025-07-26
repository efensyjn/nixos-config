{ pkgs, ... }: let
  name = "waguri";
in {
  imports =
    [
      ./hardware-configuration.nix

      ../../picks
      ../../mods
    ];
  
  networking.hostName = name;

  time.timeZone = "Indian/Maldives";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    p7zip
  ];

  picks.firefox.enable = true;
  picks.neovim.enable = true;
  picks.git.enable = true;
  picks.nh.enable = true;

  networking.networkmanager.enable = true;

  #specialisation.plasma.configuration = {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  #};

  system.stateVersion = "25.05";
}