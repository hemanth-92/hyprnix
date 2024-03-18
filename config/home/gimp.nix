{ config, lib, ... }:

let inherit (import ../../options.nix) gimp; in
lib.mkIf (gimp == true) {
  programs.gimp= {
    enable = true;
  };
}
