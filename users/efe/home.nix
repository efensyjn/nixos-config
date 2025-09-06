{ pkgs, system, ... }:

{
  ## ─── Imports ──────────────────────────────────
  imports = [
    ./programs.nix
    ./${system}
  ];

  ## ─── Home Config ──────────────────────────────
  home.username = "efe";
  home.homeDirectory = "/home/efe";
  home.stateVersion = "25.05";

  ## ─── Core Services ────────────────────────────
  programs.home-manager.enable = true;
  xdg.enable = true;
  services.gpg-agent.enable = true;

  ## ─── Packages ─────────────────────────────────
  home.packages = with pkgs; [
    # Utilities
    p7zip
    gnupg
  ];
}
