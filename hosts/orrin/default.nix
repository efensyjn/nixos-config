{ ... }:

{
  imports = [
    ../../mods
  ];

  sops.defaultSopsFile = ../../secrets/efe.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/ghe.txt";

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

  services.openssh = {
    enable = true;
  };

  services.cloudflared = {
    enable = true;
#    tunnels = {
#      "35752cf2-0cf4-49c2-8470-00b7e3b39b45" = {
#        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
#        default = "http_status:404";
#      };
#    };
  };

  system.stateVersion = "25.05";
}
