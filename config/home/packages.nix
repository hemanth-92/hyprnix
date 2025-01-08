{ pkgs, username, ... }:
let
  inherit (import ../../options.nix) wallpaperDir wallpaperGit flakeDir;
in
{
  # Install Packages For The User
  home.packages = with pkgs; [
    swww
    grim
    slurp
    swaynotificationcenter
    imv
    mpv
    tree
    tmux
    jdk17
    vlc
    bat
    ripgrep
    dua
    font-awesome
    swayidle
    wl-clipboard
    obsidian
    telegram-desktop
    inxi
    duf
    openssl_3_3
    man
    vscode
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
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
  ];
  programs.gh.enable = true;
}
