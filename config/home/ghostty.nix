{ pkgs, ... }:
{
  home.packages = (with pkgs; [ ghostty ]);

  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family =  JetBrainsMono Nerd Font
    font-size = 16

    bold-is-bright = false
    adjust-box-thickness = 1

    # Theme
    theme = catppuccin-mocha
    background-opacity = 0.95

    cursor-style = bar
    cursor-style-blink = false
    adjust-cursor-thickness = 1

    resize-overlay = never
    copy-on-select = false
    confirm-close-surface = false
    mouse-hide-while-typing = true

    window-theme = ghostty
    window-padding-x = 4
    window-padding-y = 6
    window-padding-balance = true
    window-padding-color = background
    window-inherit-working-directory = true
    window-inherit-font-size = true
    window-decoration = false

    gtk-titlebar = false
    gtk-single-instance = true
    gtk-tabs-location = bottom
    gtk-wide-tabs = false

    auto-update = off
  '';
}
