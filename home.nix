{ config, pkgs, ... }:

{
  imports = [
    ./modules/shells.nix
    ./modules/hyprland.nix
  ];

  home.username = "zemy";
  home.homeDirectory = "/home/zemy";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    kitty
    neofetch
    waybar
    rofi-wayland
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

  programs.firefox = {
    enable = true;
    profiles.zemy = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://google.com/";
        "browser.startup.page" = 3; # 0 = about:blank, 1 = home page, 2 = last visited page, 3 = resume previous session
      };
    };
  };
}
