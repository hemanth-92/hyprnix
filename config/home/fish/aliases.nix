{ config, lib, pkgs, ... }:

let inherit (import ../../../options.nix) flakeDir theShell hostname;
in 
  {
    programs.fish.shellAliases ={
      sv="sudo nvim";
      rebuild="nh os switch --hostname ${hostname}";
      update="nh os switch --hostname ${hostname} --update";
      gcCleanup="nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      v="nvim";
      ls="eza -lah";
      ll="lsd -l";
      la="lsd -a";
      lal="lsd -al";
      ".."="cd ..";
      "..."="cd ../..";
      "...."="cd ../../..";
      config="cd ~/.config";
      restart="systemctl reboot";
      poweroff="systemctl poweroff";
      neofetch="neofetch --ascii ~/.config/ascii-neofetch";
    };
  }
