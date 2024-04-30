{
  config,
  pkgs,
  ...
}: let
  imageViewer = "org.gnome.Loupe.desktop";
  mediaPlayer = "mpv.desktop";
  browser = "firefox.desktop";
  docOpener = "zathura.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  torrentClient = "transmission-gtk.desktop";
  textEditor = "neovim.desktop";
in {
  home.packages = [pkgs.xdg-utils];
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    # TODO: use 'map' to avoid unnecessary repetition.
    mimeApps = let
      br = browser;
      fm = fileManager;
      iv = imageViewer;
      mp = mediaPlayer;
      te = textEditor;
    in rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        # Office documents.
        "application/pdf" = br;

        "inode/directory" = fm;

        # Web stuff
        "x-scheme-handler/http" = br;
        "x-scheme-handler/https" = br;
        "x-scheme-handler/about" = br;
        "x-scheme-handler/unknown" = br;
        "text/html" = br;

        # Images
        "image/jpeg" = iv;
        "image/avif" = iv;
        "image/gif" = iv;
        "image/jpg" = iv;
        "image/pjpeg" = iv;
        "image/png" = iv;
        "image/tiff" = iv;
        "image/webp" = iv;
        "image/x-bmp" = iv;
        "image/x-gray" = iv;
        "image/x-icb" = iv;
        "image/x-ico" = iv;
        "image/x-png" = iv;

        # Plain text & code.
        "application/x-shellscript" = te;
        "text/plain" = te;

        # Videos
        "video/webm" = mp;
        "video/mp4" = mp;
        "video/mkv" = mp;
      };
    };
  };
}
