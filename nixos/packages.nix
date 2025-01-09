{ pkgs
, inputs
, ...
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
    lsd
    lshw
    pkg-config
    meson
    gnumake
    ninja
    go
    nodejs_23
    noto-fonts-color-emoji
    material-icons
    brightnessctl
    toybox
    virt-viewer
    ripgrep
    networkmanagerapplet
    yad
    playerctl
    nh
    inputs.nixvim.packages.${pkgs.system}.default
    powertop
    inputs.zen-browser.packages.${pkgs.system}.default
    alsa-utils
    pnpm
    deno
    speechd
    zed-editor
    postgresql # For PostgreSQL
    sqlite # For SQLite (lightweight and serverless)
    qbittorrent
    docker_26
    python313
    firefox-unwrapped
    swaynotificationcenter
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
