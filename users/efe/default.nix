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

    openssh.authorizedKeys.keys = 
      [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/TuG97qualVQ1k9I4IXfafiChp8iOhfebl78MIMwZJ efe@waguri" ];

    ## ─── Authentication ─────────────────────────
    hashedPasswordFile = config.sops.secrets."user/hashedPassword".path;
  };
}