{ config, lib, ... }:

{
  options = {
    mods.xserver = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable xserver";
      };
    };
  };

  config = {  
    services.xserver = {
      enable = lib.mkIf config.mods.xserver.enable true;
    };
  };
}