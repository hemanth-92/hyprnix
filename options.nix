let
  # THINGS YOU NEED TO CHANGE
  username = "zenith";
  hostname = "shadowblaze";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/hyprnix";
in {
  # User Variables
  username = "${username}";
  hostname = "${hostname}";
  gitUsername = "hemanth-92";
  gitEmail = "131354764+hemanth-92@users.noreply.github.com";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding

  #Hyprland desgin Settings
  borderAnim = true;

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
  clock24h = false;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de";
  theKBDVariant = "";
  theLCVariables = "en_US.UTF-8";
  theTimezone = "Asia/Kolkata";
  theShell = "fish"; # Possible options: bash, zsh , fish
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
  distrobox = false;
  flatpak = true;
  kdenlive = false;
  blender = false;
  steam = false;
  obs-studio = false;
  gimp = true;

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
