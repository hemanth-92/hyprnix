{ inputs, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
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
        theme = inputs.catppuccin-grub + "/src/catppuccin-mocha-grub-theme";
      };
    };
    supportedFilesystems.ntfs = true;
  };
}
