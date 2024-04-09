{pkgs,username, ...}:
let
  wallpaper = "/home/${username}/Pictures/Wallpapers/lofi-computer.png";
  placeholderAndTimeColor = "rgb(205, 214, 244)";
in {
  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = true;
      disable_loading_bar = false;
      no_fade_in = false;
    };

    backgrounds = [
      {
        monitor = "";
        path = "${wallpaper}";
      }
    ];

    input-fields = [
      {
        size = {
          width = 300;
          height = 40;
        };
        outline_thickness = 2;
        outer_color = "rgb(0, 0,0)";
        inner_color = placeholderAndTimeColor;
        font_color = "rgb(0,0,0)";
        fade_on_empty = false;
        placeholder_text = "password...";
        dots_spacing = 0.3;
        dots_center = true;
        fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 50; # transition time in ms between normal outer_color and fail_color
      }
    ];

    labels = [
      {
        monitor = "";
        text = "cmd[update:1000] echo \"<b><big>$(date +'%I:%M %p')</big></b>\"";
        font_family = "MonoLisa Nerd Font";
        font_size = 50;
        color = "rgb(0,0,0)";
        position = {
          x = 0;
          y = 70;
        };
        valign = "center";
        halign = "center";
      }
      #quote
      {
        text = "TIME NOT STOPPING FOR U :)";
        color = "rgba(255,0,0,1.0)";
        font_size = 25;
        font_family = "Noto Sans";
        position = {
          x = 0;
          y = 40;
        };
        halign = "center";
        valign = "center";
      }
    ];
  };
}
