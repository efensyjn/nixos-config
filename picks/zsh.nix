{ lib, config, ... }:
{
  options = {
    picks.zsh = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable zsh with oh-my-zsh";
      };
    };
  };

  config = lib.mkIf config.picks.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      /*
      autosuggestion.enable = true;
      
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      */
      
      shellAliases = {
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";
        grep = "grep --color=auto";
        vim = "nvim";
        vi = "nvim";
      };
      
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" "kubectl" ];
        theme = "robbyrussell";
      };
    };
  };
}