{ config, lib, ... }:

let inherit (import ../../options.nix) obs-studio; in
lib.mkIf (obs-studio == true) {
  programs.obs-studio= {
    enable = true;
  };
}
