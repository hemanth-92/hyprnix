{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./intel-drivers.nix
    ./programs.nix
    ./polkit.nix
    ./printer.nix
    ./services.nix
    ./audio.nix
    ./python.nix
    ./displaymanager.nix
    ./nix.nix
    ./users.nix
    ./configuration.nix
    ./xfce.nix
    ./nh.nix
    ./bluetooth.nix
    ./hyprland.nix
    ./virtualization.nix
    ./security.nix

    # import hardware
    ../hardware.nix
  ];
}
