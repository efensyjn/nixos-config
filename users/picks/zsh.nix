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
      autosuggestion.enable = true;
      
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };
  };
}