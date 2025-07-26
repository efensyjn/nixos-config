{ lib, config, pkgs, ... }:
{
  options = {
    picks.vscodium = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable VSCodium with extensions";
      };
    };
  };

  config = lib.mkIf config.picks.vscodium.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];
    };
  };
}