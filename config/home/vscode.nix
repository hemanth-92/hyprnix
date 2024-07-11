{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # python
      ms-python.python
      # Color theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      "update.mode" = "none";
      # This stuff fixes vscode freaking out when theres an update
      "extensions.autoUpdate" = false;
      # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      "window.titleBarStyle" = "custom";
      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" =
        "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" =
        "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
      "editor.fontSize" = 16;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "catppuccin.accentColor" = "lavender";
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;
      "editor.mouseWheelZoom" = true;

      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 10;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "multiple";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 1;
      "breadcrumbs.enabled" = false;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "default";
      "workbench.statusBar.visible" = true;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = false;

      "git.openRepositoryInParentFolders" = "never";
      "java" = "/etc/profiles/per-user/sdvohet/bin/java";
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "editor.accessibilitySupport" = "off";
      "terminal.integrated.env.windows" = { };
      "git.autofetch" = true;
      "window.commandCenter" = false;
      "window.zoomLevel" = 2;
      "liveServer.settings.donotShowInfoMsg" = true;
      "editor.tabSize" = 2;
      "emmet.includeLanguages" = {
        "javascript" = "true";
        "javascriptreact" = "true";
      };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";

      "editor.wordWrap" = "on";
      "explorer.confirmDelete" = false;
      "reactSnippets.settings.importReactOnTop" = false;
      "editor.cursorBlinking" = "expand";
      "editor.find.cursorMoveOnType" = false;
      "editor.cursorSmoothCaretAnimation" = "on";
    };
  };
}