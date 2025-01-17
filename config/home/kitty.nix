{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 16;
    };
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      confirm_os_window_close = 0;
      background_opacity = "0.85";
      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_foreground = "#1e1e2e";
      active_tab_background = "#cba6f7";
      inactive_tab_foreground = "#bac2de";
      inactive_tab_background = "#313244";
    };
  };
}
