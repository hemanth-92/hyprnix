{ pkgs, username, ... }:
{
  # Define a user account.
  users = {
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      hashedPassword = "$6$18JKFnAP84d62vB.$63g0TDv22PItmkWhnh26yctPwwi5K.4x48CSHnNs11bxY0yKw/setlgeCB/pePMuCEYYgoqdN9pjFLWRQ9ZXR/";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [ ];
    };
  };

}
