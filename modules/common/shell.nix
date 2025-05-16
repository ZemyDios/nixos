{
  pkgs,
  ...
} : {
  environment.shells = with pkgs; [bash zsh]; # System Shells
  users.defaultUserShell = pkgs.zsh; # Default shell

  environment.systemPackages = with pkgs; [
    oh-my-zsh
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
}