{
  pkgs,
  ...
} : {
  environment.systemPackages = with pkgs; [
    hyprpaper
    hypridle
    hyprlock
    hyprshot

    kitty
    waybar
    rofi-wayland
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true; # TODO: Idk how to make it work always. Remember to turn false systemd in hyprland home-manager config.
  };
}