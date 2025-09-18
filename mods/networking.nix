{ lib, config, ... }:

{
  options = {
    mods.networking = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable networking";
      };
    };
  };

  config = lib.mkIf config.mods.networking.enable {
    networking.networkmanager.enable = true;
    services.dnscrypt-proxy = {
      enable = true;
      settings = {
        server_names = [ "cloudflare" "quad9-dnscrypt-ip4-filter-pri" ];
        ipv6_servers = false;
        dnscrypt_servers = true;
        doh_servers = true;
      };
    };
    networking.nameservers = [ "127.0.0.1" ];
  };

}