{
  description = "In the midst of chaos, there is also opportunity.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: let
    overlays = [
      (final: prev: {
        nvchad = inputs.nix4nvchad.packages."${nixpkgs.system}".nvchad;
      })
    ];

    mkSystem = import ./lib/mksystem.nix {
      inherit overlays nixpkgs inputs;
    };
  in {
    nixosConfigurations = { 
      waguri = mkSystem "waguri" {
        system = "x86_64-linux";
        user = "efe";
      };
    };
  };
}