{ inputs, system, ... }:
{
  # home-manager
  home.packages = [ inputs.nixvim.packages.${pkgs.system}.default ];
}