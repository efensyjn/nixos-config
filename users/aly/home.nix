{ pkgs, inputs, ... }:

{
  imports = [
    ../picks  # Import your picks modules directory
    inputs.nix4nvchad.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "aly";
  home.homeDirectory = "/home/aly";
  home.stateVersion = "25.05";

  picks.neovim.enable = true;
  picks.zsh.enable = true;
  picks.git.enable = true;

  # Packages that don't need special configuration
  home.packages = with pkgs; [
    p7zip
    postgresql_18
  ];

  programs.ssh = {
    enable = true;
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # XDG configuration
  xdg.enable = true;
}