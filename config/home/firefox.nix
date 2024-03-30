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

      search = {
        default = "Google";

        engines = {
          "Google".metaData.alias = "@g";

          "Bing".metaData.alias = "@b";

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "NixOS Wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nw"];
          };
        };
      };
    };
  };
  home.sessionVariables = {
    DEFAULT_BROWSER = lib.getExe pkgs.brave;
    BROWSER = lib.getExe pkgs.brave;
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
