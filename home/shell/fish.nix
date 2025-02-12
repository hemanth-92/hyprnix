{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    fish = {
      enable = true;
      functions = {
        # use vi key bindings with hybrid emacs keybindings
        fish_user_key_bindings = ''
          fish_default_key_bindings -M insert
          fish_vi_key_bindings --no-erase insert
        '';
      };
      shellAliases = {
        ehistory = "nvim ${config.xdg.dataHome}/fish/fish_history";
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
      shellInit = ''
        # shut up welcome message
                set fish_greeting

        # set options for plugins
                set sponge_regex_patterns 'password|passwd'
      '';
      # setup vi mode
      interactiveShellInit = ''
        fish_vi_key_bindings
      '';
    };
  };

  # fish plugins, home-manager's programs.fish.plugins has a weird format
  home.packages = with pkgs.fishPlugins; [
    # used as starship's transient prompt does not handle empty commands
    transient-fish
    # do not add failed commands to history
    sponge
  ];

  # do not generate man caches as it slows down build, removes ~/.manpath
  programs.man.generateCaches = false;

  # set as default interactive shell
  programs.ghostty.settings.command = lib.mkForce (lib.getExe pkgs.fish);
}
