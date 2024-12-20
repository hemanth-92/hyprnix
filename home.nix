{ inputs, username, ... }:
let
  inherit (import ./options.nix) theme;
in
{
  # Home Manager Settings
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    sessionVariables.EDITOR = "nvim";
  };

  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./config/home
  ];

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
