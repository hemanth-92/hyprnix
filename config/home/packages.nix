{
  pkgs,
  config,
  username,
  ...
}:
let
  inherit (import ../../options.nix) wallpaperDir wallpaperGit flakeDir;
in
{
  # Install Packages For The User
  home.packages = with pkgs; [
    libvirt
    swww
    grim
    slurp
    file-roller
    swaynotificationcenter
    imv
    transmission_4-gtk
    mpv
    rustup
    audacity
    tree
    tmux
    cava
    klavaro
    jdk17
    vlc
    bat
    gotop
    fzf
    ranger
    ripgrep
    dua
    font-awesome
    swayidle
    neovide
    element-desktop
    wl-clipboard
    swaylock
    obsidian
    tenki
    loupe
    telegram-desktop
    nomacs
    inxi
    libreoffice-qt6-fresh
    nixfmt-rfc-style
    duf
    zed-editor
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # Import Scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix {
      inherit pkgs;
      inherit wallpaperDir;
      inherit username;
      inherit wallpaperGit;
    })
    (import ./../scripts/themechange.nix {
      inherit pkgs;
      inherit flakeDir;
    })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ./../scripts/web-search.nix { inherit pkgs; })
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
    (import ./../scripts/list-hypr-bindings.nix { inherit pkgs; })
  ];
  programs.gh.enable = true;
}
