{ ... }:

let inherit (import ./options.nix) gitUserName gitEmail;

in {
  programs.git = {
    enable = true;
    userName = "${gitUserName}";
    userEmail = "${gitEmail}";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "v";
      credential.helper = "store";
      github.user = gitUserName;
      push.autoSetupRemote = true;
    };
  };
}
