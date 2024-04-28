{pkgs, ...}:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
      folding = true;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        nix
        markdown
        markdown_inline
        python
        rust
      ];
    };
  };
}

