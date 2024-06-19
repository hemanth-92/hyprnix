{
  inputs,
  pkgs,
  ...
}: {
  boot = {
    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      theme = inputs.catppuccin-grub + "/src/catppuccin-mocha-grub-theme";
    };
    kernelPackages = pkgs.linuxPackages_zen;
    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
