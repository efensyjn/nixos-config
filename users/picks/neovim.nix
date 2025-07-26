{ lib, config, ... }:

{
  options = {
    picks.neovim = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable neovim";
      };
    };
  };

  config = lib.mkIf config.picks.neovim.enable { 
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}