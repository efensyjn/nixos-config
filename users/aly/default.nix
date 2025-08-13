{ pkgs, ... }:

{
  imports = [
    ../../picks
  ];

  picks.zsh.enable = true;

  users.users.aly = {
    isNormalUser = true;
    home = "/home/aly";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$dh4y97Rj/OypkyyY$aVpX2WwuwkZwrRcB0SzRczcTaM4dWI1J2ACbM4SMzLJHmtmc8tMj/MC0z2AMCM7hLAfyeivtH1rbGDtdTy49J.";
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvmjEzcl4zvI8hLFZHHF4KW1rkb4MZDYQcBc490413y vps" ];
  };
}