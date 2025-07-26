{ config, lib, ... }:

{
  options = {
    mods.sddm = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable sddm";
      };
    };
  };

  config = lib.mkIf config.mods.sddm.enable {  
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
  };
}