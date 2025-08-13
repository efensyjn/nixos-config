{ pkgs, ... }:

{
  imports = [
    ../../picks
  ];

  picks.zsh.enable = true;

  users.users.ace = {
    isNormalUser = true;
    home = "/home/ace";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$ItwUAEh3pzYVatzQ$vG1l.03314KJlAEHk7Avl.ZClCC3WzvgsuKv4iaKMkTqaWPfOnoUzCKK.UVRR/YeFrMyQR1z71KntfTm963L5.";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDWBCfWyz7MsL/nZvWaYhYNBHmDT+56uUmCX+d6yzDrrWiFCFtXlT6uRLJ91mjDIp0tLNoUREbQxwaDzkHtYi6U3QR1tvsy1PayrRtkqREcGsPUPe+K1yi62RL4Jeqx0mvJDJf+Lm39wNVHQAZvaESBVcRES3Wf/VBd+W+BZiG8LG1z4f12Me+bHgE3xhUHH6s8yehxjw5xHCbB0Fmc4RQetYHAaDk7ff6EDtCMqNf8MHsHj/dRvWkUQ46MVgiTWmLV2b3epZFJCOhOTyIDZzuEVhmglH4FiXpoUBZENsh6aGPngbJLKlMFpJlx1rvPoeZldn5yKOcG6g0WhI+Em1LcndU2Y+8xQNe/A/ELe2n+C624BVwmxYeVvWS3Ms7TiTYfdCu9rR02OABy2DY/xEyBHE3fOLNqt/jpOHVXzAH/pRURrDYeLe5EULTZplt25TN6iE87CSP5T/tDfN8tiyszAQGtVppI8VZKmDDWirz6Id9TLGeRL6UspKq3Jlm0ZEFnT/GVQRlZolJp5/6inPGgu1mVjrpj3liBfHD0bupyR5dBW9fUeib/MWBxXhuYMRRgFBhn1353ldt3ONVFqPfGT7KgatcrReqr2B1eC0ww3OZqaFLSO+LQ2al5hDYSRBHewMjiZYINcndjDPmYYmw3nayAdswXRAOmjLeFSEE/Fw== openpgp:0x0520127D" ];
  };
}