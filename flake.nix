{
  description = "Hermit in the mountains with a meticulously organized library of spells.";

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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-dokploy.url = "github:el-kurto/nix-dokploy";

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
      orrin = mkSystem "orrin" {
        system = "x86_64-linux";
        users = [ "efe" "aly" ];
      };
    };
  };
}
