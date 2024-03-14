{
  pkgs,
  lib,
  ...
}: 
{
  programs.vscode = {
    enable = true;
    # native titlebar causes vscode to crash, remove for vscode 1.86
    # https:i//github.com/microsoft/vscode/issues/184124#issuecomment-1717959995
  };
}
