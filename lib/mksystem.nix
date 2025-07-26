# edited from https://github.com/mitchellh/nixos-config

{ nixpkgs, overlays, inputs }:

name:
{
  system,
  user
}:

let

  # The config files for this system.
  hConf = ../hosts/${name};
  userConfig = ../users/${user};
  userHMConfig = ../users/${user}/home.nix;

  # NixOS
  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;

in systemFunc {
  inherit system;

  modules = [
    # Apply our overlays. Overlays are keyed by system type so we have
    # to go through and apply our system type. We do this first so
    # the overlays are available globally.
    { nixpkgs.overlays = overlays; }

    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = true; }

    hConf
    userConfig
    home-manager.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig;
      home-manager.extraSpecialArgs = { inherit inputs; };
    }
  ];
}