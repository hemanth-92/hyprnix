{
  config,
  lib,
  pkgs,
  ...
}: let
  # create a fake gnome-terminal shell script so xdg terminal applications open in the correct terminal
  # https://unix.stackexchange.com/a/642886
  fakeGnomeTerminal = pkgs.writeShellApplication {
    name = "gnome-terminal";
    text = ''${config.custom.terminal.exec} "$@"'';
  };
  nemo-patched = pkgs.cinnamon.nemo-with-extensions.overrideAttrs {
    postFixup = ''
      wrapProgram $out/bin/nemo \
        --prefix PATH : "${lib.makeBinPath [fakeGnomeTerminal]}"
    '';
  };
in {
  home.packages = with pkgs; [
    cinnamon.nemo-fileroller
    webp-pixbuf-loader # for webp thumbnails
    nemo-patched
  ];

  xdg = {
    # fix mimetype associations
    mimeApps.defaultApplications = {
      "inode/directory" = "nemo.desktop";
      # wtf zathura / pqiv registers themselves to open archives
      "application/zip" = "org.gnome.FileRoller.desktop";
      "application/vnd.rar" = "org.gnome.FileRoller.desktop";
      "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
      "application/x-bzip2-compressed-tar" = "org.gnome.FileRoller.desktop";
    };
  };

  gtk.gtk3.bookmarks = let
    homeDir = config.home.homeDirectory;
  in [
    "file://${homeDir}/Downloads"
    "file://${homeDir}/projects"
    "file://${homeDir}/Pictures/Wallpapers"
  ];

  dconf.settings = {
    # fix open in terminal
    "org/gnome/desktop/applications/terminal" = {
      exec = lib.getExe config.custom.terminal.package;
    };
    "org/cinnamon/desktop/applications/terminal" = {
      exec = lib.getExe config.custom.terminal.package;
    };
    "org/nemo/preferences" = {
      default-folder-viewer = "list-view";
      show-hidden-files = true;
      start-with-dual-pane = true;
      date-format-monospace = true;
      # needs to be a uint64!
      thumbnail-limit = lib.hm.gvariant.mkUint64 (100 * 1024 * 1024); # 100 mb
    };
    "org/nemo/window-state" = {
      sidebar-bookmark-breakpoint = 0;
      sidebar-width = 180;
    };
    "org/nemo/preferences/menu-config" = {
      selection-menu-make-link = true;
      selection-menu-copy-to = true;
      selection-menu-move-to = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    # disable transparency for file delete dialog
    windowrulev2 = ["forcergbx,floating:1,class:(nemo)"];
  };
}
