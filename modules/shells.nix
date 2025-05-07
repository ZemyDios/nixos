{
  config,
  pkgs,
  ...
}: let
  myAliases = {
    ll = "ls -l";
    os-rebuild = "sudo nixos-rebuild switch --flake .";
    user-rebuild = "home-manager switch --flake .";
  };
in {
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh"; # Make zsh default shell

  home.packages = with pkgs; [
    # powerlevel10k # El paquete de Powerlevel10k
    meslo-lgs-nf # La fuente Meslo Nerd Font, recomendada por P10k
  ];

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;

    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      size = 10000;
    };

    # completion.enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };
}
