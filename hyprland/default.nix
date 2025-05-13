{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./waybar
    ./hyprpaper
  ];

  home.packages = with pkgs; [
    kitty
    waybar
    rofi-wayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true; # Conflicts with UWSM https://wiki.hyprland.org/Useful-Utilities/Systemd-start/

    # --- Main Config ---
    settings = {

      # --- Variables ---
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";

      # --- MONITOR ---
      #
      # https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "DP-3, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, 1920x0, 1"
        ",prefered,auto,1"
      ];

      # --- INPUTS (Mouse & Keyboard) ---
      # 
      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        # Keyboard
        kb_layout = "es";

        # Mouse
        sensitivity = 0;
        accel_profile = "flat";
        follow_mouse = 1;
      };

      # --- XWAYLAND ---
      xwayland = {
        force_zero_scaling = true;
      };

      # --- AUTOSTART (exec-once) ---
      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      # --- ENVIRONMENT VARIABLES (env) ---
      #
      # https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # --- LOOK AND FEEL (general, decoration, etc.) ---
      #
      # https://wiki.hyprland.org/Configuring/Variables/

      # General
      general = {
        border_size = 2;
        no_border_on_floating = false;

        gaps_in = 5;
        gaps_out = 10;
        gaps_workspaces = 0; # Stacks with gaps_out

        "col.inactive_border" = "rgba(595959aa)";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"; 
        # "col.nogroup_border" = ;
        # "col.nogroup_border_active" = ;

        layout = "dwindle";

        allow_tearing = false;
        resize_on_border = false;
      };

      # Decoration
      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      # Animations (https://wiki.hyprland.org/Configuring/Animations/)
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # Dwindle (https://wiki.hyprland.org/Configuring/Dwindle-Layout/)
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Misc
      misc = {
        disable_hyprland_logo = true;
      };

      # --- KEYBINDINGS ---
      #
      # https://wiki.hyprland.org/Configuring/Keywords/
      bind = [
        # Main Binds
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"   # Dwindle
        "$mainMod, J, togglesplit," # Dwindle

        # Move Focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active windows to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special Workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

      ];

      # Mouse Binds
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Repeteable Multimedia Binds
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+" # La coma inicial es correcta
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      # Multimedia Binds
      bindl = [
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
      ];

      # --- WINDOWS AND WORKSPACES (windowrulev2) ---
      #
      # https://wiki.hyprland.org/Configuring/Window-Rules/
      # https://wiki.hyprland.org/Configuring/Workspace-Rules/
      windowrulev2 = [
        "suppressevent maximize, class:.*" # Ignore maximize apps requests
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland
      ];
    };
  };
}
