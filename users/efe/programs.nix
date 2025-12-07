{ inputs, config, pkgs, ... }:

{
  ## ─── Imports ──────────────────────────────────
  imports = [
    inputs.nix4nvchad.homeManagerModule
    inputs.seanime.nixosModules.seanime
  ];

  ## ─── Editors & Development ────────────────────
  programs.nvchad.enable = true;
  programs.tmux.enable = true;

  programs.git = {
    enable = true;
    userEmail = "me@efensyjn.moe";
    userName = "efensyjn";
  };

  ## ─── Terminal ─────────────────────────────────
  programs.kitty = {
    enable = true;
    settings = {
      remember_window_position = false;
      initial_window_width = 640;
      initial_window_height = 400;

      confirm_os_window_close = 0;
      dynamic_background_opacity = false;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 5;

      background_opacity = "0.95";
      background_blur = 1;
    };
  };

  ## ─── Shell ────────────────────────────────────
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

#    initContent = ''
#      unset SSH_AGENT_PID
#      if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#        export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#      fi
#      export GPG_TTY=$(tty)
#      gpg-connect-agent updatestartuptty /bye >/dev/null
#    '';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      prettybat
    ];
  };

  programs.yazi.enable = true;
  modules.home.services.seanime.enable = true;
}
