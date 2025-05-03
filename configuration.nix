{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.kernelModules = [ "amdgpu" ];
  };

  # XServer
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
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
    blender-hip
    clinfo

    wget
    git

    firefox
  ];

  programs.hyprland = { 
    enable = true;
    # Why is it working if it isnt enabled???
    withUWSM  = false; # TODO: Idk how to make it work always. Remember to turn false systemd in hyprland home-manager config.
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
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

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  programs.steam = {
    enable = true;
    # package = pkgs.steam.override { withJava = true; };
  };

  programs.java.enable = true; 

  system.stateVersion = "24.11"; # Did you read the comment?

}
