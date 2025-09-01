{ ... }:

{
  imports =
    [
      ../../mods
    ];
  
  services.automatic-timezoned.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.firefox.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.git.enable = true;
  programs.nh.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;

  hardware.opentabletdriver.enable = true;
  virtualisation.docker.enable = true;

  mods.plasma.enable = true;

  system.stateVersion = "25.05";
}