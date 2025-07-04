{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    policies = {
      BlockAboutConfig = false;
      DefaultDownloadDirectory = "\${home}/Downloads";
    };

    profiles.zenith = {
      name = "zenith";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        sponsorblock
        nord123
        playback-speed
        privacy-badger
        return-youtube-dislikes
        ublock-origin
        user-agent-string-switcher
        surfingkeys
      ];
      settings = {
        "extensions.autoDisableScopes" = 0; # enable extensions immediately upon new install
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.normandy.first_run" = false;
        "app.shield.optoutstudies.enabled" = false;
        "beacon.enabled" = true;
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
        "browser.urlbar.scotchBonnet.enableOverride" = true;
      };
    };
  };
}
