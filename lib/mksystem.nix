# edited from https://github.com/mitchellh/nixos-config

{ nixpkgs, overlays, inputs }:

name:
{
  system,
  users ? null,
  user ? null,
  unfree ? true
}:

let

  normalizedUsers =
    if users != null then users
    else if user != null then [ user ]
    else throw "Must provide either `user` or `users`.";

  hConf = ../hosts/${name};

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;

  hmUsers =
    builtins.listToAttrs (map (u: {
      name = u;
      value = import ../users/${u}/home.nix;
    }) normalizedUsers);
  userConfigs = map (u: ../users/${u}) normalizedUsers;

  pkp = ../hosts/${name}/pkgs.nix;
  pkg =
    if builtins.pathExists pkp
    then pkp
    else {};
  
  hname = name;

in systemFunc {
  inherit system;

  modules = [
    ../hosts/${name}/hardware-configuration.nix
    inputs.sops-nix.nixosModules.sops
    inputs.nix-dokploy.nixosModules.default
    inputs.aagl.nixosModules.default
    { nix.settings = inputs.aagl.nixConfig; }
    { nixpkgs.overlays = overlays; }
    { nixpkgs.config.allowUnfree = unfree; }
    { networking.hostName = name; }
    hConf
    pkg
    ]
    ++ userConfigs
    ++ [
      home-manager.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users = hmUsers;
        home-manager.extraSpecialArgs = { inherit inputs hname; };
      }
    ]
    ++ 
    [
      {
        _module.args = {
          inherit inputs;
          pkgs-stable = import inputs.nixpkgs-stable { 
            inherit system;
            config.allowUnfree = unfree;
          };
        };
      }
    ];
}
