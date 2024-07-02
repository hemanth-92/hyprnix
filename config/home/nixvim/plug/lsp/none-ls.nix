{
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      enableLspFormat = true;
      settings = { update_in_insert = false; };
      sources = {
        code_actions = {
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          yamllint.enable = true;
        };
        formatting = {
          black = {
            enable = true;
            withArgs = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            withArgs = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
          stylua.enable = true;
          yamlfmt.enable = true;
        };
      };
    };
    keymaps = [{
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }];
  };
}
