{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # python
      ms-python.python
      # Color theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}

