{ pkgs-stable, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ## ─── Utilities ───────────────────────────────
    p7zip
    docker-compose
    vscodium
    kdePackages.kate
    krita
    planify
    eza
    cloudflared

    ## ─── Communication & Media ───────────────────
    discord-ptb
    spotify
    brave
    exiftool

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
    vulkan-tools

    wine64
    winetricks
    protontricks

    indi-with-drivers

    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH

    # Vibe coding
    aider-chat-full

    uv
    python313

    direnv
    jetbrains.jdk-no-jcef
    jdk21
    libGL

    masscan
    libpcap
  ] ++ [
    pkgs-stable.lutris
    pkgs-stable.planify
    pkgs-stable.jetbrains.idea-community
    pkgs-stable.swiftshader
    pkgs-stable.kstars
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
    "electron-35.7.5"
  ];
}
