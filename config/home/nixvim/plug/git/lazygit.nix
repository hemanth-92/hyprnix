{pkgs, ...}: 
let
  plugins = pkgs.vimPlugins;
in
{
  plugins = {
    lazygit-nvim.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];
}
