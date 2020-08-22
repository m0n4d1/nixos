{ pkgs, ... }:
{
  programs.tmux = {  
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
    terminal = "xterm-256color";
    keyMode = "vi";
  };
}

