let
  # THINGS YOU NEED TO CHANGE
  username = "zenith";
  hostname = "shadowblaze";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/hyprnix";
in
{
  # User Variables
  username = "${username}";
  hostname = "${hostname}";
  gitUsername = "hemanth-92";
  gitEmail = "131354764+hemanth-92@users.noreply.github.com";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding

  # Wallpaper and Directory Settings
  wallpaperGit = "https://github.com/hemanth-92/Wallpaper-bank.git"; # This will give you my wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script)
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.hyprnix-previous";
  flakeBackup = "${userHome}/.hyprnix-backup";

  #theming
  theme = "catppuccin-mocha";
  #cursorTheme = "Simp1e-Tokyo-Night-Storm";

  # System Settings
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de";
  theKBDVariant = "";
  theLCVariables = "en_US.UTF-8";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS!
  intel-bus-id = "PCI:1:0:0";
  nvidia-bus-id = "PCI:0:2:0";

}
