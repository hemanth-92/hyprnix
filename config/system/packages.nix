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
    swappy
    ripgrep
    networkmanagerapplet
    yad
    playerctl
    nh
    inputs.nixvim.packages.${pkgs.system}.default
    powertop
    alsa-utils
    inputs.zen-browser.packages."${system}".specific
    pnpm
    deno
    speechd
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
  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    noto-fonts-cjk-sans
    jetbrains-mono
    font-awesome
    terminus_font
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
