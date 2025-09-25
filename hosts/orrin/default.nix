{ config, ... }:

{
  imports = [
    ../../mods
  ];

  sops.age.keyFile = "/var/lib/sops-nix/ghe.txt";

  sops.secrets.cloudflared-creds = {
    sopsFile = ../../secrets/cloudflared-creds.json;
    format = "json";
    key = "";
  };

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

  networking.networkmanager.unmanaged = [ "wlp2s0" ];

  # ─── Virtualisation ──────────────────────────────────
  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "8fc7be20-3956-41a2-ab88-2ece7658e349" = {
        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        default = "http_status:404";
      };
    };
  };

  system.stateVersion = "25.05";
}
