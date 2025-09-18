{ pkgs, config, ... }:

{
  sops.defaultSopsFile = ../../secrets/efe.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/ghe.txt";

  sops.secrets."user/hashedPassword" = {
    owner = "efe";
    neededForUsers = true;
  };

  users.users.efe = {
    isNormalUser = true;
    home = "/home/efe";
    shell = pkgs.zsh;

    ## ─── Groups ─────────────────────────────────
    extraGroups = [
      "wheel"    # sudo/admin
      "plugdev"  # device access
      "docker"
    ];

    ## ─── Authentication ─────────────────────────
    hashedPasswordFile = config.sops.secrets."user/hashedPassword".path;
  };
}