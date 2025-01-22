{
  pkgs,
  inputs,
  ...
}:
{
  # Install Packages For The User
  home.packages = with pkgs; [

    ## CLI utility
    brightnessctl # read brightness
    ani-cli
    caligula # User-friendly, lightweight TUI for disk imaging
    dconf-editor
    docfd # TUI multiline fuzzy document finder
    fd # find replacement
    ffmpeg
    file # Show file information
    gifsicle # gif utility
    gtrash # rm replacement, put deleted files in system trash
    htop
    imv # image viewer
    jq # JSON processor
    killall
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    nitch # systhem fetch util
    nixd # nix lsp
    nixfmt-rfc-style # nix formatter
    openssl
    onefetch # fetch utility for git repo
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    poweralertd
    ripgrep # grep replacement
    treefmt2 # project formatter
    tldr
    todo # cli todo list
    toipe # typing test in the terminal
    ttyper # cli typing test
    unzip
    unrar
    yt-dlp-light
    xdg-utils
    inxi # show system information
    powertop

    # Show Disk Usage
    dua
    duf

    ## GUI Apps
    libreoffice
    nix-prefetch-github
    resources # GUI resources monitor
    vlc
    obsidian
    telegram-desktop
    qbittorrent
    evince # pdf
    audacious
    zenity

    tree
    swayidle
    lm_sensors
    nwg-look

    ## CLI
    cbonsai # terminal screensaver
    cmatrix
    pipes # terminal screensaver
    tty-clock # cli clock

    # editors
    vscode
    zed-editor
    inputs.nixvim.packages.${pkgs.system}.default
    code-cursor

    # C / C++
    gcc
    gdb
    gnumake

    # js
    nodejs_22
    pnpm
    deno

    # Python
    python3
    python312Packages.ipython

    # java
    jdk23

    # zen-browser
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
  programs.gh.enable = true;
}
