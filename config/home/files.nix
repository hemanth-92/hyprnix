_: {
  # Place Files Inside Home Directory
  home.file = {
    ".emoji".source = ./files/emoji;
    ".base16-themes".source = ./files/base16-themes;
    ".config/ascii-fastfetch".source = ./files/ascii-fastfetch;
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
