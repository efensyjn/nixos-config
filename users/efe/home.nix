{ pkgs, inputs, ... }:

{
  imports = [
    ../picks  # Import your picks modules directory
    inputs.nix4nvchad.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "efe";
  home.homeDirectory = "/home/efe";
  home.stateVersion = "25.05";

  picks.kitty.enable = true;
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
    obs-studio
    mpv

    kdePackages.kleopatra
    gnupg
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # XDG configuration
  xdg.enable = true;

  services.gpg-agent.enable = true;
  services.gpg-agent.enableSshSupport = true;
  services.gpg-agent.sshKeys = [ "9DC5AB95C58ABAA2BA37C0DBED346BB528F122A3" ];
}