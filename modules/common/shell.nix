{
  pkgs,
  ...
} : {
  environment.shells = with pkgs; [bash zsh]; # System Shells
  users.defaultUserShell = pkgs.zsh; # Default shell

  programs.zsh.enable = true;
}