{ pkgs, config, ... }:

{
  sops.defaultSopsFile = ../../secrets/efe.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/ghe.txt";

  sops.secrets."aly/hashedPassword" = {
    owner = "efe";
    neededForUsers = true;
  };

  users.users.aly = {
    isNormalUser = true;
    home = "/home/aly";
    shell = pkgs.zsh;

    ## ─── Groups ─────────────────────────────────
    extraGroups = [
      "wheel"    # sudo/admin
    ];

    ## ─── Authentication ─────────────────────────
    hashedPasswordFile = config.sops.secrets."aly/hashedPassword".path;
  };
}