{ pkgs, ... }:
{
  # List services that you want to enable:
  services = {
    openssh.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    throttled.enable = true; # On battery ur cpu will go down to 400 freq if this is off
    tlp.enable = true;
    libinput.enable = true;
    flatpak.enable = false;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      # bye bye xterm
      excludePackages = [ pkgs.xterm ];
    };

  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  zramSwap.enable = true;

  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  # Battery saving.
  networking.networkmanager.wifi.powersave = true;
  powerManagement.enable = true;

  # services = {
  #   greetd = {
  #     enable = true;
  #     vt = 3;
  #     settings = {
  #       default_session = {
  #         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --cmd Hyprland";
  #       };
  #     };
  #   };
  # };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb_114;
  };

  systemd.services.flatpak-repo = {
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  security.rtkit.enable = true;

  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };
}
