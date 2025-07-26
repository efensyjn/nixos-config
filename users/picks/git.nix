{ lib, config, ... }:
{
  options = {
    picks.git = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable git with basic configuration";
      };
      userName = lib.mkOption {
        type = lib.types.str;
        default = "efe";
        description = "Git user name";
      };
      userEmail = lib.mkOption {
        type = lib.types.str;
        default = "me@efensyjn.moe";
        description = "Git user email";
      };
    };
  };

  config = lib.mkIf config.picks.git.enable {
    programs.git = {
      enable = true;
      userName = config.picks.git.userName;
      userEmail = config.picks.git.userEmail;
    };
  };
}