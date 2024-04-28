{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
        mode = "n";
        options = {
          silent = true;
          desc = "Toggle neotree";
        };
      }
    ];
  };
}
