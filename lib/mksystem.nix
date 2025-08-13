# edited from https://github.com/mitchellh/nixos-config

{ nixpkgs, overlays, inputs }:

name:
{
  system,
  users ? null,
  user ? null
}:

let

  normalizedUsers =
    if users != null then users
    else if user != null then [ user ]
    else throw "Must provide either `user` or `users`.";

  # The config files for this system.
  hConf = ../hosts/${name};
  #userConfig = ../users/${user};
  #userHMConfig = ../users/${user}/home.nix;

  # NixOS
  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;

  hmUsers =
    builtins.listToAttrs (map (u: {
      name = u;
      value = import ../users/${u}/home.nix;
    }) normalizedUsers);
  userConfigs = map (u: ../users/${u}) normalizedUsers;

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
    ]
    ++ userConfigs
    ++ [
      home-manager.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users = hmUsers;
        home-manager.extraSpecialArgs = { inherit inputs; };
      }
    ];
}