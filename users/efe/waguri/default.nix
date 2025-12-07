{ pkgs, ... }:

{

  services.dunst = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.mpv = {
    enable = true; 
    config = {
      gpu-api = "opengl";     # Force OpenGL instead of Vulkan
      hwdec = "auto-safe";    # Optional: safer hardware decoding
    };
  };

}
