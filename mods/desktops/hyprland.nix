{ lib, config, ... }:

{
  imports = [
    ../greeters/sddm.nix
  ];

  options = {
    mods.hyprland = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable hyprland";
      };
    };
  };

  config = lib.mkIf config.mods.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    config.mods.sddm.enable = true;
  };
}