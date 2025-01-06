{ pkgs, ... }:
{
  # setup pipewire for audio
  # Fixes pipewire bug casuing the camera to always be on
  # draining battery for no reason.
  # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2669
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };
  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [ pavucontrol ];
}
