{ pkgs, ... }:
{
  # setup pipewire for audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
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
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [ pavucontrol ];
}
