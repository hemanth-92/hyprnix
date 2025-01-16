{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./intel-drivers.nix
    ./packages.nix
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

    # import hardware
    ../hardware.nix
  ];
  environment.variables = {
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
