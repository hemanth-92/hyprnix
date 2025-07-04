_: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    profileExtra = ''
      #if [ -z "$DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
      #  exec Hyprland
      #fi
    '';
    sessionVariables = { };
    shellAliases = {
      sv = "sudo nvim";
      rebuild = "nh os switch";
      update = "nh os switch --update";
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
