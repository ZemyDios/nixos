{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/default.nix
    
    ./modules/shells.nix
    ./modules/firefox.nix
    ./modules/git.nix
  ];

  home.username = "zemy";
  home.homeDirectory = "/home/zemy";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    neofetch
    dolphin
    vscode
    pavucontrol
  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
