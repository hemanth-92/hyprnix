{
  inputs,
  lib,
  pkgs,
  user,
  ...
}:
let
  firefoxPkg = pkgs.firefox-devedition-bin;
in
{
  programs = {
    # firefox dev edition
    firefox = {
      enable = true;
      package = firefoxPkg;

      profiles.sdvohet = {
        name = "sdvohet";
        isDefault = true;
      
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          screenshot-capture-annotate
          sponsorblock
          ublock-origin
        ];
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    # do not idle while watching videos
    windowrule = [ "idleinhibit fullscreen,firefox-aurora" ];
  };

  # overwrite desktop entry with user profile
  xdg.desktopEntries.firefox-developer-edition = {
    name = "Firefox Developer Edition";
    genericName = "Web Browser";
     icon = "${firefoxPkg}/share/icons/hicolor/128x128/apps/firefox.png";
    categories = [
      "Network"
      "WebBrowser"
    ];
  };
}
