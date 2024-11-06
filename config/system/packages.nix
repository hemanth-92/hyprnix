{
  pkgs,
  inputs,
  ...
}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    cmatrix
    lolcat
    htop
    btop
    libvirt
    polkit_gnome
    lm_sensors
    unzip
    unrar
    libnotify
    v4l-utils
    ydotool
    wl-clipboard
    socat
    cowsay
    lsd
    lshw
    pkg-config
    meson
    hugo
    gnumake
    ninja
    go
    nodejs_22
    noto-fonts-color-emoji
    material-icons
    brightnessctl
    toybox
    virt-viewer
    swappy
    ripgrep
    networkmanagerapplet
    yad
    playerctl
    nh
    gimp
    inputs.nixvim.packages.${pkgs.system}.default
    powertop
    alsa-utils
    inputs.zen-browser.packages."${system}".specific
    sqlite
    turso-cli
    pnpm
    deno
  ];

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };
  virtualisation.libvirtd.enable = true;
}
