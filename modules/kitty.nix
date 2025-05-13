{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;

    settings = {
      # Fuente
      font_family = "MesloLGS NF"; # Reemplaza por la fuente que uses (Nerd Font recomendada para P10k)
      font_size = 11.0;

      # Margen y padding (para que no toque los bordes)
      window_padding_width = 14; # Espacio entre la ventana y el contenido
      # Otros paddings si necesitas control más fino:
      padding_height = 26;
      # padding_width = 0;

      # Color scheme (si no usas un archivo de tema separado)
      # background_opacity = 0.4; # Only works in X11, probably
      # background = "#1e1e2e";
      # foreground = "#cdd6f4";
      # ... otros colores ...

      # Opciones de cursor
      # cursor = "#f5e0dc";
      cursor_shape = "underline"; # "block", "beam", "underline"
      cursor_blink_interval = 1; # 0 para sin parpadeo

    };
  };
}
