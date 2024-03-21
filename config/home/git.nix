{ config,pkgs,... }:

let 
  inherit (import  ../../options.nix) gitUsername gitEmail;

in 
{
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
    extraConfig = {
      init={
        defaultBranch = "main";
      };
      push={
        autoSetupRemote = true;
      };
       core = {
         # use fileystem monitor daemon to speed up git status for large repos like nixpkgs
         fsmonitor = true;
       };
    };
  };
}
