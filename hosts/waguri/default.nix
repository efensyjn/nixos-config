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

  services.mongodb = {
    enable = true;
  };

  services.ollama = {
    enable = true;
    loadModels = [ "deepseek-r1" "gemma3" "llama3.1" "llama2-uncensored" ];
    acceleration = "cuda";
  };
  services.open-webui = {
    enable = true;
    openFirewall = true;
  };

  system.stateVersion = "25.05";
}
