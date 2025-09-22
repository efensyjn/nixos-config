{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ## ─── Utilities ───────────────────────────────
    p7zip
    docker-compose

    ## ─── Security & Passwords ────────────────────
    sops
    age

    ## ─── Libraries & Dependencies ─
    gnutls
    sqlite
    openssl
  ];
}
