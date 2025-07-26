{ lib, config, ... }:
{
  options = {
    picks.git = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable git with basic configuration";
      };
    };
  };

  config = lib.mkIf config.picks.git.enable {
    programs.git = {
      enable = true;
    };
  };
}