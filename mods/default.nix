{ ... }:

{
  imports = [
    ./nvidia.nix

    ./services/libinput.nix
    ./services/pipewire.nix
    ./services/xserver.nix

    ./desktops/hyprland.nix
    ./desktops/plasma.nix

    ./specialization/hyprland.nix
  ];
}