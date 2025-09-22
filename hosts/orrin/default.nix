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

  services.openssh = {
    enable = true;
  };

  systemd.services.gitlab-backup.environment.BACKUP = "dump";

  system.stateVersion = "25.05";
}