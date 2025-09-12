{ config, lib, ... }:

{
  options = {
    mods.libinput = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable libinput";
      };
    };
  };

  config = {  
    services.libinput = {
      enable = lib.mkIf config.mods.libinput.enable true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
}