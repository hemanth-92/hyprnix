{pkgs, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      rounded_corners = true;
      color_theme = "dracula";
      theme_background = false;
      update_ms = 500;
    };
  };
  home.packages = with pkgs; [nvtopPackages.intel];
}
