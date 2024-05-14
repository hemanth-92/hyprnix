{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (import ../../options.nix) flakeDir theShell hostname;
in
  lib.mkIf (theShell == "fish") {
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
          rebuild = "nh os switch --hostname ${hostname}";
          update = "nh os switch --hostname ${hostname} --update";
          gcCleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
          v = "nvim";
          ls = "eza -lah";
          ll = "lsd -l";
          la = "lsd -a";
          lal = "lsd -al";
          ".." = "cd ..";
          "..." = "cd ../..";
          "...." = "cd ../../..";
          config = "cd ~/.config";
          restart = "systemctl reboot";
          poweroff = "systemctl poweroff";
          nf = "neofetch --ascii ~/.config/ascii-neofetch";
          fs = "fastfetch";
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
    programs.kitty.settings.shell = lib.mkForce (lib.getExe pkgs.fish);
  }
