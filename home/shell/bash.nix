{ hostname, ... }:
{
  # Configure Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      sv = "sudo nvim";
      rebuild = "nh os switch";
      update = "nh os switch -H ${hostname} --update -- --cores 6";
      gcclean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";
      v = "nvim";
      ls = "eza --icons";
      ll = "eza -lh --icons --grid --group-directories-first";
      la = "eza -lah --icons --grid --group-directories-first";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      config = "cd ~/.config";
      restart = "systemctl reboot";
      poweroff = "systemctl poweroff";
      cat = "bat";
    };
  };
}
