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

    anime-game-launcher.enable = true;
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

    ## Vibe coding
    ollama.enable = true;
    ollama.acceleration = "cuda";
    
    qbittorrent.enable = true;

    n8n.enable = true;

    searx = {
      enable = true;
      redisCreateLocally = true;
      settings = {
        server = {
          bind_address = "::1";
          port = 6867;
          # WARNING: setting secret_key here might expose it to the nix cache
          # see below for the sops or environment file instructions to prevent this
          secret_key = "aaa";
          public_instance = false;
          limiter = false;
        };
        search.formats = ["html" "json"];
      };
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
    specialization.hyprland.enable = true;
  };

  # ─── Virtualisation ──────────────────────────────────
  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  users.extraGroups.vboxusers.members = [ "efe" ];

  system.stateVersion = "25.05";
}
