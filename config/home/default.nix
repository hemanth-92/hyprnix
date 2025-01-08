{
  imports = [
    # Enable &/ Configure Programs
    ./bash.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kitty.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./wlogout.nix
    ./swappy.nix
    ./swaync.nix
    ./zoxide.nix
    ./obs-studio.nix
    ./git.nix
    ./brave.nix
    ./vesktop.nix
    ./eza.nix
    # Place Home Files Like Pictures
    ./files.nix
    ./yazi.nix
    ./fish.nix
    ./zathura.nix
    ./firefox.nix
    ./hyprlock.nix
    ./btop.nix
    ./cava.nix
    ./bat.nix
    ./fastfetch.nix
    ./direnv.nix
    ./zsh.nix
    ./obs-studio.nix
    ./xdg.nix
    ./ghostty.nix
    ./tmux.nix
    ./nemo.nix
  ];
  programs = {
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
