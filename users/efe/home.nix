{ pkgs, ... }:

{
  imports = [
    ../picks  # Import your picks modules directory
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "efe";
  home.homeDirectory = "/home/efe";
  home.stateVersion = "25.05";

  picks.neovim.enable = true;
  picks.zsh.enable = true;
  picks.git = {
    enable = true;
    userName = "efe";
    userEmail = "me@efensyjn.moe";
  };

  # Packages that don't need special configuration
  home.packages = with pkgs; [
    # Gaming and Entertainment
    lutris
    prismlauncher
    discord-ptb
    en-croissant
    bottles

    # Development Tools
    nixfmt-rfc-style
    nixd

    # Utilities
    p7zip
    kdePackages.kate
    keepassxc

    krita
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # XDG configuration
  xdg.enable = true;
}