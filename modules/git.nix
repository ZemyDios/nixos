{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ZemyDios";
    userEmail = "tonicrespomengual@gmail.com";
  }
}