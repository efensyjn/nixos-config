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
        default = "";
        description = "";
      };
      userEmail = lib.mkOption {
        type = lib.types.str;
        default = "";
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