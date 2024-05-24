{pkgs, ...}: {
  config = {
    home = {
      packages = [pkgs.fastfetch];
    };

    xdg.configFile."fastfetch/config.jsonc".text = builtins.toJSON {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      "logo" = {
        "padding" = {
          "top" = 2;
        };
        "type" = "small";
      };
      "display" = {
        "separator" = " -> ";
      };
      "modules" = [
        "break"
        {
          "type" = "title";
          "keyWidth" = 10;
          "format" = "      {6}{7}{8}";
        }
        {
          "type" = "custom";
          "format" = "  ╭───────────────────────╮";
        }
        {
          "type" = "kernel";
          "key" = " ";
          "format" = "{1} {2} ({4})";
          "keyColor" = "yellow";
        }
        {
          "type" = "wm";
          "key" = " ";
          "keyColor" = "blue";
        }
        {
          "type" = "shell";
          "key" = " ";
          "keyColor" = "yellow";
        }
        {
          "type" = "terminal";
          "key" = " ";
          "keyColor" = "blue";
        }
        {
          "type" = "packages";
          "key" = "󰏖 ";
          "keyColor" = "yellow";
        }
        {
          "type" = "memory";
          "key" = "󰍛 ";
          "keyColor" = "magenta";
          # format: used / total
          "format" = "{1} / {2}";
        }
        {
          "type" = "uptime";
          "key" = "󰔛 ";
          "keyColor" = "green";
        }
        {
          "type" = "disk";
          "key" = "󱥎 ";
          "format" = "{1} / {2} ({3})";
          "folders" = "/";
        }
        {
          "type" = "cpu";
          "key" = "󰻠 ";
          "keyColor" = "green";
        }
        {
          "type" = "gpu";
          "key" = " 󰻑 ";
          "keyColor" = "green";
        }
        {
          "type" = "custom";
          "format" = "  ╰───────────────────────╯";
        }
        "break"
      ];
    };
  };
}
