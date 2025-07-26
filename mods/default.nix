{ ... }:

{
  imports = [
    ./nvidia.nix

    ./services/libinput.nix
    ./services/pipewire.nix
    ./services/xserver.nix
  ];
}