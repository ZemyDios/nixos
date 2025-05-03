{ config, pkgs, ... }:

# Hyprpaper wiki: https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    enable = true;
    
    settings = {
      ipc = true;
      splash = false;
      splash_offset = 2.0;

      preload = [ "$HOME/.config/wallpapers/wallpaper.jpg" ];

      wallpaper = [
        "DP-3, $HOME/.config/wallpapers/wallpaper.jpg"
        "HDMI-A-1, $HOME/.config/wallpapers/wallpaper.jpg"
      ];

    };

  };

  # Path: $HOME/.config/wallpapers
  xdg.configFile."wallpapers".source = ./wallpapers;
}