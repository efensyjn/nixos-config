{ pkgs, ... }:

{
  imports = [
    ../../picks
  ];

  picks.vscodium.enable = true;
  picks.zsh = {
    enable = true;
    cont = ''
        unset SSH_AGENT_PID
        if [ "''${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
          export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
        fi
        export GPG_TTY=$(tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null
      '';
  };
  picks.steam.enable = true;

  users.users.efe = {
    isNormalUser = true;
    home = "/home/efe";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$star........mLWP$EFE.MIUZOqV3H/LJ5oIkFYJ2wqpNjUNw5vIgP07DDC1lPQGGxR/fS4aFGpWzz0TzgKjYdERyf7vqE9usxQ/J3/";
  };
}