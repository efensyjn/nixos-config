{ pkgs, ... }@e:

let
  hostname = e.hname;
in
{
  ## ─── Imports ──────────────────────────────────
  imports = [
    ./programs.nix
    #./${hostname}
  ];

  ## ─── Home Config ──────────────────────────────
  home.username = "aly";
  home.homeDirectory = "/home/aly";
  home.stateVersion = "25.05";

  ## ─── Core Services ────────────────────────────
  programs.home-manager.enable = true;
  xdg.enable = true;

  ## ─── Packages ─────────────────────────────────
  home.packages = with pkgs; [
    # Utilities
    p7zip
    gnupg
    sops
    age
  ];
}