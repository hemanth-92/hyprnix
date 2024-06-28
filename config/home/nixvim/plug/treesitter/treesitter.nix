{ pkgs, ... }: {
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
      folding = true;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        bash
        c
        cmake
        comment
        cpp
        css
        csv
        diff
        dockerfile
        fish
        gitcommit
        gitignore
        git_rebase
        graphql
        html
        ini
        javascript
        json
        jsonc
        lua
        make
        markdown
        markdown_inline
        meson
        ninja
        nix
        prisma
        po
        python
        rasi
        requirements # pip requirements.txt
        rst
        rust
        sql
        toml
        tsv
        tsx
        typescript
        vim
        vimdoc
        xml
        yaml
      ];
    };
  };
}
