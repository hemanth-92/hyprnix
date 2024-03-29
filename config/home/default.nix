{ pkgs, config, ... }:

{
  imports = [
    # Enable &/ Configure Programs
    ./alacritty.nix
    ./bash.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kdenlive.nix
    ./kitty.nix
    ./neofetch.nix
    ./neovim.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./wlogout.nix
    ./swappy.nix
    ./swaylock.nix
    ./swaync.nix
    ./wezterm.nix
    ./zsh.nix
    ./zoxide.nix
    ./vscode.nix
    ./obs-studio.nix
    ./gimp.nix
    ./git.nix
    ./brave.nix
    ./discord.nix
    ./eza.nix
    # Place Home Files Like Pictures
    ./files.nix
    ./yazi.nix
  ];
}
