{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    os-rebuild = "sudo nixos-rebuild switch --flake .";
    user-rebuild = "home-manager switch --flake .";
  };

in {
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}