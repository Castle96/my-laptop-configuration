{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./power-management.nix
    ./packages.nix
    ./desktop.nix
  ];

  system.stateVersion = "23.05"; # Match your NixOS version
  networking.hostName = "latitude-7300";

  # Security and user settings
  security.sudo.enable = true;
  users.users.kyle = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };
}
