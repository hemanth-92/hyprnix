{ pkgs, ... }:

let
  my-python-packages =
    ps: with ps; [
      pandas
      requests
      setuptools
      torch
      diffusers
      jupyter
      notebook
      matplotlib
      seaborn
      accelerate
      transformers
    ];
in
{
  environment.systemPackages = with pkgs; [ (pkgs.python3.withPackages my-python-packages) ];
}
