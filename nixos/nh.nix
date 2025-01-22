{ pkgs, username, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/hyprnix";
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
