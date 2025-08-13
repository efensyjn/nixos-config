{ pkgs, inputs, ... }:

{
  imports = [
    ../picks  # Import your picks modules directory
    inputs.nix4nvchad.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ace";
  home.homeDirectory = "/home/ace";
  home.stateVersion = "25.05";

  picks.neovim.enable = true;
  picks.zsh.enable = true;
  picks.git.enable = true;

  # Packages that don't need special configuration
  home.packages = with pkgs; [
    # Development Tools
    nixfmt-rfc-style
    nixd

    # Utilities
    p7zip
    gnupg
  ];

  programs.ssh = {
    enable = true;
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # XDG configuration
  xdg.enable = true;
}