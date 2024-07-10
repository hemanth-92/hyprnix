{ pkgs, ... }:
{
  imports = [
    ./sets.nix
    ./keys.nix

    ./plug/completion/cmp.nix
    ./plug/completion/lspkind.nix
    ./plug/completion/luasnip.nix

    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix
    ./plug/git/worktree.nix
    ./plug/git/fugitive.nix
    ./plug/git/diffview.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/none-ls.nix
    ./plug/lsp/trouble.nix
    ./plug/lsp/hlchunk.nix

    ./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    ./plug/ui/alpha.nix
    ./plug/ui/bufferline.nix
    ./plug/ui/lualine.nix
    ./plug/ui/noice.nix
    ./plug/ui/neoscroll.nix
    ./plug/ui/nvim-notify.nix
    ./plug/ui/telescope.nix

    ./plug/utils/extra.nix
    ./plug/utils/dap.nix
    ./plug/utils/flash.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/oil.nix
    ./plug/utils/undotree.nix
    ./plug/utils/neotree.nix
    ./plug/utils/comment.nix
    ./plug/utils/toogleterm.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
  };

  home.packages = with pkgs; [ lazygit ];
}
