{...}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      popupBorderStyle = "rounded";
      filesystem.hijackNetrwBehavior = "open_current";
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>b";
        mode = "n";
        options = {
          silent = true;
          desc = "Toggle neotree";
        };
      }
    ];
  };
}
