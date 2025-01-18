{ inputs, username, ... }:
{
  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./home
    ../scripts/default.nix
    ./hyprland/default.nix
  ];

  # Home Manager Settings
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    sessionVariables.EDITOR = "nvim";
  };

  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes."catppuccin-mocha";

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  programs.home-manager.enable = true;
}
