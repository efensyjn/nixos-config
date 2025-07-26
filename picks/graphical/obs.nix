{ config, pkgs, lib, ... }:

{
  options = {
    picks.obs = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable obs";
      };
      nvidia = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable nvidia hardware accel";
      };
    };
  };
  
  config = {
    assertions = [
      {
        assertion = !config.picks.obs.nvidia || config.mods.nvidia.enable;
        message = "Option `picks.obs.nvidia` can only be enabled if nvidia modules are on is true.";
      }
    ];
    programs.obs-studio = {
      enable = 
        lib.mkIf config.picks.obs.enable
        true;

      package = (
        pkgs.obs-studio.override {
          cudaSupport = if config.picks.obs.nvidia then true else false;
        }
      );

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-gstreamer
        obs-vkcapture
      ];
    };
  };
}