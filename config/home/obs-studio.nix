{pkgs, config, lib, ... }:

let inherit (import ../../options.nix) obs-studio; in
lib.mkIf (obs-studio == true) {
  home.packages = with pkgs; [
    pkgs.obs-studio
  ];
}
