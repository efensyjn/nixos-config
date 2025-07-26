# File: shared/neovim.nix (Context-aware module)
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
    environment.systemPackages = with pkgs; [
      neovim
    ];

    environment.variables = {
      EDITOR = "nvim";
    };

    environment.shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}