{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../picks
      ../../mods
    ];
  
  networking.hostName = "waguri";

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

  mods.plasma.enable = true;

  system.stateVersion = "25.05";
}
