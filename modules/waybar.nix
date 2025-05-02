{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {

      mainBar = {

        output = [
          "DP-3"
          "HDMI-A-1"
        ];

        layer = "top";
        position = "top";
        height = 30;

        # Modules
        modules-left = [ "cpu" "memory" "temperature" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "pulseaudio/slider" "clock" ];

        # Modules configuration
        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "clock" = {
          "format-alt" = "{%H:%M}";
        };

        "cpu" = {
          "format" = "CPU: {usage}%";
        };

        "memory" = {
          "format" = "RAM: {used:0.1f}G/{total:0.1f}G";
        };

        "pulseaudio/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
        };

      };

    };

    style = ''
      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }
      #pulseaudio-slider trough {
        min-height: 10px;
        min-width: 80px;
        border-radius: 5px;
        background-color: black;
      }
      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: green;
      }
    '';

  };
}