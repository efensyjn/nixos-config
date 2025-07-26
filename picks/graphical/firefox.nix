{ lib, config, ... }:

{
  options = {
    picks.firefox = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable firefox";
      };
    };
  };

  config = {
    programs.firefox = {
      enable = 
        lib.mkIf config.picks.firefox.enable
        true;
    };
  };
}