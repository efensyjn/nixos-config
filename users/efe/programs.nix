{ inputs, config, ... }:

{
  ## ─── Imports ──────────────────────────────────
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  ## ─── Editors & Development ────────────────────
  programs.nvchad.enable = true;
  programs.git.enable = true;

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
      window_padding_width = 10;

      background_opacity = "0.9";
      background_blur = 0;

      symbol_map = let
        mappings = [
          "U+23FB-U+23FE"
          "U+2B58"
          "U+E200-U+E2A9"
          "U+E0A0-U+E0A3"
          "U+E0B0-U+E0BF"
          "U+E0C0-U+E0C8"
          "U+E0CC-U+E0CF"
          "U+E0D0-U+E0D2"
          "U+E0D4"
          "U+E700-U+E7C5"
          "U+F000-U+F2E0"
          "U+2665"
          "U+26A1"
          "U+F400-U+F4A8"
          "U+F67C"
          "U+E000-U+E00A"
          "U+F300-U+F313"
          "U+E5FA-U+E62B"
        ];
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
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

    initContent = ''
      unset SSH_AGENT_PID
      if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
      fi
      export GPG_TTY=$(tty)
      gpg-connect-agent updatestartuptty /bye >/dev/null
    '';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
