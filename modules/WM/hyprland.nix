{
  pkgs,
  ...
} : {
  environment.systemPackages = with pkgs; [
    kitty
    waybar
    rofi-wayland
    hyprpaper
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true; # TODO: Idk how to make it work always. Remember to turn false systemd in hyprland home-manager config.
  };
}