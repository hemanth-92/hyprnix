{ hostname, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    git
    wget
    curl
  ];

  #Allow allowUnfree Packages
  nixpkgs.config.allowUnfree = true;

  # Define your hostname
  networking = {
    hostName = "${hostname}";
    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone
  time.timeZone = "Asia/Kolkata";
  console.keyMap = "us";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

   # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    # bye bye xterm
    excludePackages = [ pkgs.xterm ];
  };


  # zram
  zramSwap.enable = true;

  system.stateVersion = "23.11";
}
