{ config, lib, ... }:
let
  browser = [ "zen.desktop" ];
  video = [ "mpv.desktop" ];
  image = [ "imv.desktop" ];
  nvim = [ "nvim.desktop" ];

  # XDG MIME types

  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "application/json" = browser;
    "application/pdf" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = [ "chromium-browser.desktop" ];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;
    "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];

    "audio/*" = video;
    "video/*" = video;
    "image/*" = image;

    "text/plain" = nvim;
    "application/x-shellscript" = nvim;
    "text/csv" = nvim;
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
