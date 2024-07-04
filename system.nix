{
  pkgs,
  username,
  hostname,
  options,
  ...
}:
let
  inherit (import ./options.nix) gitUsername flakeDir;
in
{
  imports = [
    ./hardware.nix
    ./config/system
  ];

  # Enable networking
  networking.hostName = "${hostname}"; # Define your hostname
  networking.networkmanager.enable = true;
  networking.timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  # Set your time zone
  time.timeZone = "Asia/Kolkata";

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

  console.keyMap = "us";

  # Define a user account.
  users = {
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      hashedPassword = "$6$18JKFnAP84d62vB.$63g0TDv22PItmkWhnh26yctPwwi5K.4x48CSHnNs11bxY0yKw/setlgeCB/pePMuCEYYgoqdN9pjFLWRQ9ZXR/";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
      ];
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [ ];
    };
  };

  environment.variables = {
    FLAKE = "${flakeDir}";
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    EDITOR = "nvim";
  };

  # Optimization settings and garbage collection automation
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "23.11";
}
