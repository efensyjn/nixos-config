{ config, lib, pkgs, ... }:

{
  options = {
    picks.steam = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable steam";
      };
    };
  };

  config = lib.mkIf config.picks.steam.enable {
    programs.steam = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      steam-run
      wineWowPackages.stableFull
      winetricks
    ];

    programs.nix-ld.enable = true;
    programs.gamemode.enable = true;
    programs.steam.gamescopeSession.enable = true;
  };
}
