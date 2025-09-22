{ config, lib, ... }:

{
  imports = [
    ../desktops/hyprland.nix
    ../desktops/plasma.nix
  ];

  options = {
    mods.specialization.hyprland = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable hyprland specialization";
      };
    };
  };

  config = lib.mkIf config.mods.specialization.hyprland.enable {  
    specialisation.hyprland.configuration = {
      mods.hyprland.enable = true;
      mods.plasma.enable = lib.mkForce false;
    };
  };

}