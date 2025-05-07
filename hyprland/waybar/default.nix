{
  config,
  pkgs,
  ...
}:
# Waybar Wiki: https://github.com/Alexays/Waybar/wiki
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # Use "pkill -SIGUSR2 waybar" to reload waybar
  xdg.configFile = {
    "waybar/config".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
