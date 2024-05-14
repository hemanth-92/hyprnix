_: {
  programs = {
    git = {
      enable = true;
      userName = "hemanth-92";
      userEmail = "131354764+hemanth-92@users.noreply.github.com";
      difftastic = {
        enable = true;
        background = "dark";
      };
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        alias = {
          # blame with ignore whitespace and track movement across all commits
          blame = "blame -w -C -C -C";
          diff = "diff --word-diff";
        };
        branch = {
          master = {
            merge = "refs/heads/master";
          };
          main = {
            merge = "refs/heads/main";
          };
          sort = "-committerdate";
        };
        core = {
          # use fileystem monitor daemon to speed up git status for large repos like nixpkgs
          fsmonitor = true;
        };
        diff = {
          tool = "nvim -d";
          guitool = "code";
          colorMoved = "default";
        };
        format = {
          pretty = "format:%C(yellow)%h%Creset -%C(red)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset";
        };
        merge = {
          conflictstyle = "diff3";
        };
        pull = {
          rebase = true;
        };
        push = {
          default = "simple";
        };
        # reuse record resolution: git automatically resolves conflicts using the recorded resolution
        rerere = {
          enabled = true;
          autoUpdate = true;
        };
      };
    };

    lazygit.enable = true;
  };
  home.shellAliases = {
    lg = "lazygit";
    ga = "git add";
    gc = "git clone";
    gcm = "git commit -m";
    gaa = "git add --all";
    gb = "git branch";
    gbrd = "git push origin -d";
    gcaam = "git add --all && git commit --amend";
    gcam = "git commit --amend";
    gco = "git checkout";
    gl = "git pull";
    glg = "git log";
    gm = "git merge";
    gp = "git push";
    gpf = "git push --force-with-lease";
    glc = ''git pull origin "$(git rev-parse --abbrev-ref HEAD)"'';
    gpc = ''git push origin "$(git rev-parse --abbrev-ref HEAD)"'';
    gpcf = ''git push origin --force-with-lease "$(git rev-parse --abbrev-ref HEAD)"'';
    gpatch = "git diff --no-ext-diff";
    groot = "cd $(git rev-parse - -show-toplevel)";
    grh = "git reset --hard";
    gri = "git rebase --interactive";
    gst = "git status -s -b && echo && git log | head -n 1";
    gsub = "git submodule update --init --recursive";
    # access github page for the repo we are currently in
    github = "open `git remote -v | grep github.com | grep fetch | head -1 | awk '{print $2}' | sed 's/git:/http:/git'`";
    # cleanup leftover files from merges
    mergeclean = "find . -type f -name '*.orig' -exec rm -f {} ;";
  };
}
