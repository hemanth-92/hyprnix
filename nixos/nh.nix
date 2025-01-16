{ pkgs, username, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/hyprnix";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
