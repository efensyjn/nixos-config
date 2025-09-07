{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ## ─── Utilities ───────────────────────────────
    p7zip
    docker-compose
    vscodium
    kdePackages.kate
    krita
    planify

    ## ─── Communication & Media ───────────────────
    discord-ptb
    spotify
    brave

    ## ─── Security & Passwords ────────────────────
    cryptomator
    keepassxc
    kdePackages.kleopatra
    sops
    age

    ## ─── Gaming & Emulation ──────────────────────
    steam-run
    protonup-qt
    lutris
    prismlauncher
    rpcs3
    osu-lazer
    en-croissant
    vinegar

    ## ─── Gaming Tools / Performance ──────────────
    dxvk
    mangohud
    meson
    pkgsi686Linux.gperftools   # required for CS:Source

    ## ─── Libraries & Dependencies ─
    libgpg-error
    libxml2
    freetype
    gnutls
    openldap
    SDL2
    sqlite
    xml2
  ];
}
