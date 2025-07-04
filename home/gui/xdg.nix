{ config, lib, ... }:
let
  browser = [ "brave.desktop" ];
  video = [ "mpv.desktop" ];
  image = [ "imv.desktop" ];
  nvim = [ "nvim.desktop" ];
  archive = [ "org.gnome.FileRoller.desktop" ];
  pdf = [ "org.gnome.Evince.desktop" ];

  # XDG MIME types

  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "application/json" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = [ "chromium-browser.desktop" ];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];

    "audio/*" = video;
    "video/*" = video;
    "image/*" = image;

    "text/plain" = nvim;
    "application/x-shellscript" = nvim;
    "text/csv" = nvim;

    "inode/directory" = "nemo.desktop";

    "application/zip" = archive;
    "application/vnd.rar" = archive;
    "application/x-7z-compressed" = archive;
    "application/x-bzip2-compressed-tar" = archive;
    "application/x-tar" = archive;

    "image/jpeg" = image;
    "image/png" = image;
    "image/gif" = image;
    "image/webp" = image;
    "image/tiff" = image;
    "image/x-tga" = image;
    "image/vnd-ms.dds" = image;
    "image/x-dds" = image;
    "image/bmp" = image;
    "image/vnd.microsoft.icon" = image;
    "image/vnd.radiance" = image;
    "image/x-exr" = image;
    "image/x-portable-bitmap" = image;
    "image/x-portable-graymap" = image;
    "image/x-portable-pixmap" = image;
    "image/x-portable-anymap" = image;
    "image/x-qoi" = image;
    "image/svg+xml" = image;
    "image/svg+xml-compressed" = image;
    "image/avif" = image;
    "image/heic" = image;
    "image/jxl" = image;

    "application/pdf" = pdf;
  };
in
{

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    configFile."mimeapps.list" = lib.mkIf config.xdg.mimeApps.enable { force = true; };

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
