# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  # THINGS YOU NEED TO CHANGE
  username = "sdvohet";
  hostname = "hyprnix";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/hyprnix";
  waybarStyle = "simplebar"; # simplebar, slickbar, or default

in 
{
  # User Variables
  username = "sdvohet";
  hostname = "hyprnix";
  gitUsername = "hemanth-92";
  gitEmail = "hemanth9679@gmail.com";
  browser = "firefox";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding


  #Hyprland desgin Settings
  slickbar = if waybarStyle == "slickbar" then true else false;
  simplebar = if waybarStyle == "simplebar" then true else false;
  bar-number = true; # Enable / Disable Workspace Numbers In Waybar
  borderAnim = true;
 
  
  # Wallpaper and Directory Settings
  wallpaperGit = "https://github.com/hemanth-92/Wallpaper-bank.git"; # This will give you my wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script) 
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.zaneyos-previous";
  flakeBackup = "${userHome}/.zaneyos-backup";
 
  #theming
  theme = "catppuccin-mocha";
  #cursorTheme = "Simp1e-Tokyo-Night-Storm";

  # System Settings
  clock24h = false;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de";
  theKBDVariant = "";
  theLCVariables = "en_US.UTF-8";
  theTimezone = "Asia/Kolkata";
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11 set here
  

  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "intel";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  intel-bus-id = "PCI:1:0:0";
  nvidia-bus-id = "PCI:0:2:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = true;

  # Enable Printer & Scanner Support
  printer = true;

  # Enable Flatpak & Larger Programs
  distrobox = true;
  flatpak = true;
  kdenlive = false;
  blender = false;

  # Enable Support For
  # Logitech Devices
  logitech = true;

  # Enable Terminals
  # If You Disable All You Get Kitty
  wezterm = false;
  alacritty = false;
  kitty = true;

  # Enable Python & PyCharm
  python = true;
  
  # Enable SyncThing
  syncthing = false;

}
