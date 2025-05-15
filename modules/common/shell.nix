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

  programs.zsh.enable = true;
}