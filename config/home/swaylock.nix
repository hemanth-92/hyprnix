{
  pkgs,
  config,
  ...
}: let
  palette = config.colorScheme.palette;
in {
  home.file.".config/swaylock/config".text = ''
    indicator-caps-lock
    show-failed-attempts
    ignore-empty-password
    indicator-thickness=15
    indicator-radius=150
    image=~/.config/swaylock-bg.jpg
    ring-color=${palette.base0D}
    key-hl-color=${palette.base0F}
    line-color=00000000
    inside-color=00000088
    inside-clear-color=00000088
    separator-color=00000000
    text-color=${palette.base05}
    text-clear-color=${palette.base05}
    ring-clear-color=${palette.base0D}

      settings = {
        clock = true;
        screenshot = true;
        effect-blur = "20x10";

        font = ubuntu;
        font-size = 25;

        indicator-radius = 90;
        indicator-thickness = 15;

        bs-hl-color = base09;
        key-hl-color = base0B;

        inside-clear-color = base00;
        inside-color = base00;
        inside-ver-color = base00;
        inside-wrong-color = base00;

        line-uses-ring = true;
        ring-clear-color = base0A;
        ring-color = base03;
        ring-ver-color = base0D;
        ring-wrong-color = base08;
        separator-color = base03;

        text-caps-lock-color = base09;
        text-clear-color = base04;
        text-color = base04;
        text-ver-color = base04;
        text-wrong-color = base04;
  '';
}
