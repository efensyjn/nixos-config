{ lib, config, pkgs, ... }:

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
    programs.nvchad = {
      enable = true;
      extraPackages = with pkgs; [
        nixd
      ];
      hm-activation = true;
      backup = true;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}