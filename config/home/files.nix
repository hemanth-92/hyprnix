_: {
  # Place Files Inside Home Directory
  home.file = {
    ".emoji".source = ./files/emoji;
    ".base16-themes".source = ./files/base16-themes;
    ".config/rofi/rofi.jpg".source = ./files/rofi.jpg;
    ".config/swaylock-bg.jpg".source = ./files/media/swaylock-bg.jpg;
    ".config/ascii-neofetch".source = ./files/ascii-neofetch;
    ".local/share/fonts" = {
      source = ./files/fonts;
      recursive = true;
    };
    ".config/wlogout/icons" = {
      source = ./files/wlogout;
      recursive = true;
    };
    ".config/obs-studio" = {
      source = ./files/obs-studio;
      recursive = true;
    };
  };
}
