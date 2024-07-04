{
  pkgs,
  config,
  username,
  ...
}:
let
  wallpaper = "/home/${username}/Pictures/Wallpapers/lofi-Room.png";
in
{
  xdg.configFile."hypr/hyprlock.conf".text = with config.colorScheme.palette; ''
        background {
          monitor =
            path = ${wallpaper}
        }
      general  {
        hide_cursor = true
          disable_loading_bar = false
          no_fade_in = false
      }

      input-field {
        monitor =
          size = 300,40
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgb(${base00})
          inner_color = rgb(${base01})
          font_color = rgb(${base05})
          fade_on_empty = true
          placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
          hide_input = false
          position = 0, 50
          halign = center
          valign = bottom
      }

    # Current time
      label {
        monitor =
          text = cmd[update:1000] echo "<b><big> $(date +"%I:%M %p") </big></b>"
          color = rgb(0,0,0)
          font_size = 64
          font_family = MonoLisa Nerd Font
          position = 0, 16
          halign = center
          valign = center
      }
  '';

  home.packages = with pkgs; [ hyprlock ];
}
