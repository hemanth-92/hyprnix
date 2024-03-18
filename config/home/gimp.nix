{ pkgs,config, lib, ... }:

let inherit (import ../../options.nix) gimp; in
lib.mkIf (gimp == true) {
  home.packages = with pkgs;[
    pkgs.gimp
  ];
}
