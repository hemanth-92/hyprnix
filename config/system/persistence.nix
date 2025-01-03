_:
{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      # "/etc/machine-id"
    ];
    users.zenith = {
      directories = [
        "Downloads"
        "Music"
        "Documents"
        "Pictures"
        "Videos"
        "zaneyos"
        ".local/share/sddm"
        ".mozilla"
        ".cache"
        ".ssh"
        ".config/discord"
        ".config/obs-studio"
        ".steam"
      ];
      files = [ ];
    };
  };
}
