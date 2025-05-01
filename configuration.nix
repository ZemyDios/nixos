{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zemy-os"; # Define your hostname.

  # Shells
  environment.shells = with pkgs; [ bash zsh ];
  users.defaultUserShell = pkgs.bash;

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zemy = {
    isNormalUser = true;
    description = "Zemy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Make sudo passwordless
  security.sudo.extraRules = [{
    users = ["zemy"];
    commands = [{ 
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  # Enable automatic login for the user.
  services.getty.autologinUser = "zemy";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    wget
    git

    firefox
  ];

  programs.hyprland = { 
    enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # Audio
  hardware.pulseaudio.enable = false;
  
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Uncomment the following line if you want to use JACK applications
    # jack.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.bash.shellAliases = {
    rebuild = "nixos-rebuild switch --use-remote-sudo --flake .#zemy-os";
  };

  system.stateVersion = "24.11"; # Did you read the comment?

}
