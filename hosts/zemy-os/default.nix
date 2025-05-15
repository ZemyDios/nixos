{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/WM/hyprland.nix
  ];

  system.stateVersion = "24.11"; # NixOS Version
  networking.hostName = "zemy-os"; # System Hostname
  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enable Flakes
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = ["amdgpu"];
      verbose = false;
    };

    # Config from https://wiki.nixos.org/wiki/Plymouth.
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    # Themes: https://github.com/adi1090x/plymouth-themes
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };
  };

  # XServer
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
  };

  hardware.graphics = {
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];

    enable32Bit = true;
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zemy = {
    isNormalUser = true;
    description = "Zemy";
    extraGroups = ["networkmanager" "wheel"];
  };

  # Make sudo passwordless
  security.sudo.extraRules = [
    {
      users = ["zemy"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  # Enable automatic login for the user.
  services.getty = {
    autologinUser = "zemy";
    greetingLine = "";
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    wget
    neofetch
    tree

    nixd
    alejandra
    stow

    dolphin
    vscode
    pavucontrol
    vesktop
  ];
}
