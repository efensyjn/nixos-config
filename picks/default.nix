{ ... }:

{
  imports = [
    ./graphical/firefox.nix
    ./graphical/obs.nix
    ./graphical/steam.nix

    ./editors/neovim.nix
    ./editors/vscodium.nix
    
    ./git.nix
    ./nh.nix
    ./zsh.nix
  ];
}