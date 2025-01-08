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

    # import hardware
    ../hardware.nix
  ];
  environment.variables = {
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
