{ pkgs, ... }:

let
  my-python-packages =
    ps: with ps; [
      pandas
      requests
      setuptools
      rich
      tkinter
      pillow
    ];
in
{
  environment.systemPackages = with pkgs; [ (pkgs.python3.withPackages my-python-packages) ];
}
