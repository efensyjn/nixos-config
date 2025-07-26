{ lib, config, ... }:

{
  options = {
    picks.nh = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable nh";
      };
    };
  };

  config = {
    programs.nh = {
      enable = 
        lib.mkIf config.picks.nh.enable
        true;
    };
  };
}