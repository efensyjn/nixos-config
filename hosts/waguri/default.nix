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
    # Browsers
    firefox.enable = true;

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

    # Gaming
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;

    # Shells
    zsh.enable = true;

    thunderbird.enable = true;
  };

  # ─── Services ────────────────────────────────────────
  services = {
    flatpak.enable = true;

    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58f", MODE="0666"
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1085", MODE="0666"
    '';

    hardware.openrgb = {
      enable = true;
      motherboard = "intel";
    };
  };

  # ─── Hardware ────────────────────────────────────────
  hardware.opentabletdriver.enable = true;

  # ─── Mods ────────────────────────────────────────────
  mods = {
    nvidia.enable = true;
    networking.enable = true;

    libinput.enable = true;
    pipewire.enable = true;
    xserver.enable = true;

    plasma.enable = true;
  };

  # ─── Virtualisation ──────────────────────────────────
  virtualisation.docker.enable = true;

  system.stateVersion = "25.05";
}