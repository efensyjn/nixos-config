{ lib, ... }:

{
  imports = [
    ../desktops/hyprland.nix
    ../desktops/plasma.nix
  ];
  specialisation.hyprland.configuration = {
    mods.hyprland.enable = true;
    mods.plasma.enable = lib.mkForce false;
  };
}