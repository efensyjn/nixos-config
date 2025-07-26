{ lib, config, pkgs, ... }:

{
  imports = [
    ../greeters/sddm.nix
  ];

  options = {
    mods.plasma = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable kde plasma 6";
      };
    };
  };

  config = lib.mkIf config.mods.plasma.enable {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
    config.mods.sddm.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];
  };
}