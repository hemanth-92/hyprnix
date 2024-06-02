{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;
      nvim-ufo.enable = true;
      ts-autotag.enable = true;
      which-key.enable = true;
    };
  };
}
