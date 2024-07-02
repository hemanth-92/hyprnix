{ pkgs, ... }:
{
  config = {
    home = {
      packages = [ pkgs.fastfetch ];
    };

    xdg.configFile."fastfetch/config.jsonc".text = builtins.toJSON {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      "logo" = {
        "padding" = {
          "top" = 6;
        };
        "source" = "~/.config/ascii-fastfetch";
        "height" = 15;
        "width" = 16;
      };
      "display" = {
        "separator" = " ➜  ";
      };
      "modules" = [
        "break"
        {
          "type" = "os";
          "key" = "OS   ";
          "keyColor" = "31"; # = color1
        }
        {
          "type" = "kernel";
          "key" = " ├  ";
          "keyColor" = "31";
        }
        {
          "type" = "packages";
          "format" = "{} (nixpkgs)";
          "key" = " ├ 󰏖 ";
          "keyColor" = "31";
        }
        {
          "type" = "shell";
          "key" = " └  ";
          "keyColor" = "31";
        }
        "break"
        {
          "type" = "wm";
          "key" = "WM   ";
          "keyColor" = "32";
        }
        {
          "type" = "wmtheme";
          "key" = " ├ 󰉼 ";
          "keyColor" = "32";
        }
        {
          "type" = "icons";
          "key" = " ├ 󰀻 ";
          "keyColor" = "32";
        }
        {
          "type" = "cursor";
          "key" = " ├  ";
          "keyColor" = "32";
        }
        {
          "type" = "terminal";
          "key" = " ├  ";
          "keyColor" = "32";
        }
        {
          "type" = "terminalfont";
          "key" = " └  ";
          "keyColor" = "32";
        }
        "break"
        {
          "type" = "host";
          "format" = "{5} {1} Type {2}";
          "key" = "PC   ";
          "keyColor" = "33";
        }
        {
          "type" = "cpu";
          "format" = "{1} ({3}) @ {7} GHz";
          "key" = " ├  ";
          "keyColor" = "33";
        }
        {
          "type" = "gpu";
          "format" = "{1} {2} @ {12} GHz";
          "key" = " ├ 󰢮 ";
          "keyColor" = "33";
        }
        {
          "type" = "memory";
          "key" = " ├  ";
          "keyColor" = "33";
        }
        {
          "type" = "swap";
          "key" = " ├ 󰓡 ";
          "keyColor" = "33";
        }
        {
          "type" = "disk";
          "key" = " ├ 󰋊 ";
          "keyColor" = "33";
        }
        {
          "type" = "monitor";
          "key" = " └  ";
          "keyColor" = "33";
        }
        "break"
        {
          "type" = "custom";
          "key" = "Age  ";
          "format" = "Uptime/Age";
          "keyColor" = "33";
        }
        {
          "type" = "uptime";
          "key" = " ├  ";
          "keyColor" = "33";
        }
        {
          "type" = "command";
          "key" = " └  ";
          "keyColor" = "33";
          "text" = "birth_install=$(stat -c %Y /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        "break"
      ];
    };
  };
}
