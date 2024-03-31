{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    policies = {
      BlockAboutConfig = false;
      DefaultDownloadDirectory = "\${home}/downloads";
    };

    profiles.sdvohet = {
      name = "sdvohet";
      isDefault = true;

      extensions = with inputs.firefox-addons.packages.${pkgs.system};[
        sponsorblock
        kristofferhagen-nord-theme
        playback-speed
        privacy-badger
        return-youtube-dislikes
        ublock-origin
        user-agent-string-switcher
        screenshot-capture-annotate
        vimium
      ];
      settings = {
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.normandy.first_run" = false;
        "app.shield.optoutstudies.enabled" = false;
        "beacon.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.discovery.enabled" = false;
        "browser.display.use_system_colors" = true;
        "keyword.enabled" = true;
        "media.eme.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.globalprivacycontrol.was_ever_enabled" = true;
        "security.ask_for_password" = 1;
        "security.password_lifetime" = 0;
      };

    };
  };
  home.sessionVariables = {
    DEFAULT_BROWSER = lib.getExe pkgs.firefox;
    BROWSER = lib.getExe pkgs.firefox;
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  wayland.windowManager.hyprland.settings = {
    # do not idle while watching videos
    windowrule = [ "idleinhibit fullscreen,firefox-aurora" ];
  };
}
