{pkgs,username, ...}:
# Fetch the fontName variable from system/options.nix to determine which font to use.
let
  # TODO: Replace this with proper Catppuccin colors. 
  wallpaper = "/home/${username}/Pictures/Wallpapers/cat-leaves.png";
  placeholderAndTimeColor = "rgb(205, 214, 244)";
in {
  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = true;
      disable_loading_bar = false;
      no_fade_in = false;
    };

    # The background image is fetched from GitHub. I don't store my wallpapers locally.
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
        outer_color = "rgb(69, 71, 90)";
        inner_color = placeholderAndTimeColor;
        font_color = "rgb(127, 132, 156)";
        fade_on_empty = false;
        placeholder_text = "password...";
        dots_spacing = 0.3;
        dots_center = true;
        fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 300; # transition time in ms between normal outer_color and fail_color
      }
    ];

    labels = [
      {
        monitor = "";
        text = " cmd[update:1000] echo $TIME";
        font_family = "MonoLisa Nerd Font";
        font_size = 50;
        color = placeholderAndTimeColor;
        position = {
          x = 0;
          y = 70;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
# Thanks to Fufexan for creating these amazing home-manager modules.
