{ ... } : {

   programs = {

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    git = {
      enable = true;

      config = {

        # Sección [core] - Opciones del núcleo de Git
        core = {
          editor = "nvim"; # Editor por defecto 
        };

        # Sección [alias]
        alias = {
          st = "status";           # git st
          co = "checkout";         # git co rama
          br = "branch";           # git br
          ci = "commit";           # git ci
          di = "diff";             # git di
          hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"; # git hist
          type = "cat-file -t";    # git type <hash> (muestra tipo de objeto)
          dump = "cat-file -p";    # git dump <hash> (muestra contenido de objeto)
        };

        # Sección [init]
        init = {
          defaultBranch = "main";
        };
      };
    };

    firefox = {
      enable = true;

      preferences = {

        # Privacidad y Seguridad
        "browser.contentblocking.category" = "strict"; # Protección de rastreo estricta
        "browser.search.countryCode" = "ES"; # Código de país para búsqueda
        "browser.search.region" = "ES"; # Región para búsqueda
        "doh-rollout.enabled" = true; # Habilitar DNS sobre HTTPS (DoH)
        "browser.urlbar.suggest.searches" = false; # No sugerir búsquedas en la barra URL
        "browser.urlbar.suggest.history" = true; # Sugerir historial en la barra URL

        # Apariencia y UI
        "browser.ui.toolbar.customize.bookmarks.show" = false; # Mostrar barra de marcadores
        "browser.compactmode.show" = false; # Mostrar opción de modo compacto UI
        "browser.uidensity" = 1; # 0: compact, 1: normal, 2: touch

        # Rendimiento
        "media.autoplay.default" = 5; # 5 = Bloquear autoplay por defecto
        "browser.sessionstore.interval" = 60000; # Guardar sesión cada 60s (menos escrituras SD/SSD)

        # PDF Viewer
        "pdfjs.disabled" = false; # Habilitar visor PDF integrado (true para deshabilitar)

        # Telemetría y Recopilación de Datos (si quieres deshabilitar)
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;

        # Pocket 
        "extensions.pocket.enabled" = false;

      };

      policies = {

        Extensions = {
          Install = [

            # uBlock Origin (ID: uBlock0@raymondhill.net)
            "uBlock0@raymondhill.net"

            # Dark Reader (ID: darkreader@alexander.ferenets.repl.mozilla.com)
            "darkreader@alexander.ferenets.repl.mozilla.com"

          ];
        };
      };
    };

    

  };

}