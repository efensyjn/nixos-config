{ ... }:

{
  imports = [
    ../../mods
  ];

  services.automatic-timezoned.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # ─── Bootloader ──────────────────────────────────────
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ─── Programs ────────────────────────────────────────
  programs = {
    # Editors
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    # Development tools
    git.enable = true;
    nh.enable = true;

    # Shells
    zsh.enable = true;
  };

  # ─── Mods ────────────────────────────────────────────
  mods = {
    networking.enable = true;
  };

  # ─── Virtualisation ──────────────────────────────────
  virtualisation.docker.enable = true;

  sops.defaultSopsFile = ../../secrets/efe.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/ghe.txt";

  sops.secrets."server/gitlab/dbPassword".owner = "efe";
  sops.secrets."server/gitlab/rootPassword".owner = "efe";
  sops.secrets."server/gitlab/".owner = "efe";

  services.gitlab = {
    enable = true;
    databasePasswordFile = pkgs.writeText "dbPassword" "zgvcyfwsxzcwr85l";
    initialRootPasswordFile = pkgs.writeText "rootPassword" "dakqdvp4ovhksxer";
    secrets = {
      secretFile = pkgs.writeText "secret" "Aig5zaic";
      otpFile = pkgs.writeText "otpsecret" "Riew9mue";
      dbFile = pkgs.writeText "dbsecret" "we2quaeZ";
      jwsFile = pkgs.runCommand "oidcKeyBase" {} "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts = {
      localhost = {
        locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
      };
    };
  };

  services.openssh.enable = true;

  systemd.services.gitlab-backup.environment.BACKUP = "dump";

  system.stateVersion = "25.05";
}