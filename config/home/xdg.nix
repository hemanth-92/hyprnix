{
  config,
  pkgs,
  ...
}:let
  imageViewer = "org.gnome.Loupe.desktop";
  mediaPlayer = "mpv.desktop";
  browser = "firefox.desktop";
  docOpener = "zathura.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  torrentClient = "transmission-gtk.desktop";
in {
  home.packages = [pkgs.xdg-utils];
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mimeApps = rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        "application/pdf" = [docOpener];
        "inode/directory" = [fileManager];
        "x-scheme-handler/magnet" = torrentClient;

        # Web stuff
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
        "text/html" = [browser];

        # Images
        "image/jpeg" = imageViewer;
        "image/avif" = imageViewer;
        "image/gif" = imageViewer;
        "image/jpg" = imageViewer;
        "image/pjpeg" = imageViewer;
        "image/png" = imageViewer;
        "image/tiff" = imageViewer;
        "image/webp" = imageViewer;
        "image/x-bmp" = imageViewer;
        "image/x-gray" = imageViewer;
        "image/x-icb" = imageViewer;
        "image/x-ico" = imageViewer;
        "image/x-png" = imageViewer;

        # Videos
        "video/webm" = mediaPlayer;
        "video/mp4" = mediaPlayer;
        "video/mkv" = mediaPlayer;
      };
    };
  };
  xdg.configFile."mimeapps.list".force = true;
}
