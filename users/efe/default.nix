{ pkgs, ... }:

{
  imports = [
    ../../picks
  ];

  picks.vscodium.enable = true;
  picks.zsh.enable = true;
  picks.steam.enable = true;

  users.users.efe = {
    isNormalUser = true;
    home = "/home/efe";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$star........mLWP$EFE.MIUZOqV3H/LJ5oIkFYJ2wqpNjUNw5vIgP07DDC1lPQGGxR/fS4aFGpWzz0TzgKjYdERyf7vqE9usxQ/J3/";
  };
}