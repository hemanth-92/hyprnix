{ pkgs, username, ... }:
{
  # Install Packages For The User
  home.packages = with pkgs; [
    swww
    grim
    slurp
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
    (import ../../scripts/emopicker9000.nix { inherit pkgs; })
    (import ../../scripts/task-waybar.nix { inherit pkgs; })
    (import ../../scripts/squirtle.nix { inherit pkgs; })
    (import ../../scripts/wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../../scripts/screenshootin.nix { inherit pkgs; })
  ];
  programs.gh.enable = true;
}
