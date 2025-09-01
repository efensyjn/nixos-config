{ pkgs, ... }:

{

  imports = [
    ./programs.nix
  ];

  home.username = "efe";
  home.homeDirectory = "/home/efe";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
  xdg.enable = true;

  services.gpg-agent.enable = true;

  home.packages = with pkgs; [
    # Gaming and Entertainment
    lutris
    prismlauncher
    en-croissant
    osu-lazer

    discord-ptb

    # Development Tools
    nixfmt-rfc-style
    nixd

    # Utilities
    p7zip
    kdePackages.kate

    krita

    gnupg
  ];
}