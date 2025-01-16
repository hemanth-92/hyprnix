{ pkgs
, inputs
, ...
}:
{
  # List System Programs
  environment.systemPackages = with pkgs; [
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
    ripgrep
    yad
    playerctl
    inputs.nixvim.packages.${pkgs.system}.default
    powertop
    inputs.zen-browser.packages.${pkgs.system}.default
    pnpm
    deno
    speechd
    zed-editor
    postgresql # For PostgreSQL
    sqlite # For SQLite (lightweight and serverless)
    qbittorrent
    docker_26
    python313
    evince # pdf
    code-cursor
    libreoffice-qt6-fresh
  ];

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
