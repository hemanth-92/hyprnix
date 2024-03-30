{ config, lib, ... }:
{
  programs = {
    zathura = {
      enable = true;
      mappings = {
        u = "scroll half-up";
        d = "scroll half-down";
        D = "toggle_page_mode";
        r = "reload";
        R = "rotate";
        K = "zoom in";
        J = "zoom out";
        p = "print";
        i = "recolor";
      };
      extraConfig = ''
        include "${config.xdg.cacheHome}/wallust/zathurarc"
      '';
      options = {
        statusbar-h-padding = 0;
        statusbar-v-padding = 0;
        page-padding = 1;
        adjust-open = "best-fit";
        recolor = true; # invert by default
      };
    };
  };
}
