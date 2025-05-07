{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hyprland

    ./modules/shells.nix
    ./modules/firefox.nix
    ./modules/git.nix
  ];

  home.username = "zemy";
  home.homeDirectory = "/home/zemy";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    neofetch
    tree
    dolphin
    vscode
    pavucontrol
    vesktop
    nixd
    alejandra
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  services.mako = {
    enable = true;
  };

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
