{ pkgs, ... }:

{
  users.users.efe = {
    isNormalUser = true;
    home = "/home/efe";
    shell = pkgs.zsh;

    ## ─── Groups ─────────────────────────────────
    extraGroups = [
      "wheel"    # sudo/admin
      "plugdev"  # device access
    ];

    ## ─── Authentication ─────────────────────────
    hashedPassword = "$6$star........mLWP$EFE.MIUZOqV3H/LJ5oIkFYJ2wqpNjUNw5vIgP07DDC1lPQGGxR/fS4aFGpWzz0TzgKjYdERyf7vqE9usxQ/J3/";
  };
}