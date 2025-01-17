{ pkgs, ... }:
{
  environment.variables = {
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  environment.systemPackages = with pkgs; [
    polkit_gnome # dbus session to show auth diaglogs
  ];

  security.rtkit.enable = true;
  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };
}
