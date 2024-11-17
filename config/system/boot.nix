{ pkgs
, config
, ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "nowatchdog"
      "modprobe.blacklist=iTCO_wdt" # watchdog for Intel
    ];

    # This is for OBS Virtual Cam Support
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
    };
    supportedFilesystems.ntfs = true;
  };
  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
}
