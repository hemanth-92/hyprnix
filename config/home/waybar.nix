{
  pkgs,
  config,
  lib,
  ...
}:
let
  palette = config.colorScheme.palette;
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
with lib;
{
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "custom/startmenu"
          "hyprland/window"
          "pulseaudio"
          "cpu"
          "memory"
        ];
        modules-right = [
          "custom/hyprbindings"
          "custom/exit"
          "idle_inhibitor"
          "custom/themeselector"
          "custom/notification"
          "battery"
          "clock"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "clock" = {
          format = " {:%I:%M %p}";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
        };
        "hyprland/window" = {
          max-length = 25;
          separate-outputs = false;
          rewrite = {
            "" = " 🙈 No Windows? ";
          };
        };
        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip = true;
        };
        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };
        "disk" = {
          format = " {free}";
          tooltip = true;
        };
        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };
        "custom/themeselector" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && theme-selector";
        };
        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };
        "custom/startmenu" = {
          tooltip = false;
          format = " ";
          on-click = "sleep 0.1 && rofi-launcher";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = true;
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && task-waybar";
          escape = true;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
      }
    ];
    style = concatStrings [
      ''
        * {
          font-size: 16px;
          font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
          font-weight: bold;
        }
        window#waybar {
          background-color: rgba(26,27,38,0);
          border-bottom: 1px solid rgba(26,27,38,0);
          border-radius: 0px;
          color: #${palette.base0F};
        }
        #workspaces {
          color: #${palette.base00};
          background: transparent;
          margin: 4px;
          border-radius: 0px;
          border: 0px;
          font-style: normal;
        }
        #workspaces button{
          color: #${palette.base03};
          background: #${palette.base00};
          margin: 4px 3px;
          opacity: 1;
          border: 0px;
          border-radius: 15px;
          transition: ${betterTransition};
        }
        #workspaces button.active {
          color: #${palette.base00};
           background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});            background-size: 300% 300%;
          animation: swiping 15s linear infinite;
          border-radius: 15px;
          margin: 4px 3px;
          opacity: 1.0;
          border: 0px;
          min-width: 45px;
          transition: ${betterTransition};
        }
        #workspaces button:hover {
          color: #${palette.base05};
          border: 0px;
          border-radius: 15px;
          transition: ${betterTransition};
        }
        @keyframes gradient_horizontal {
          0% {
            background-position: 0% 50%;
          }
          50% {
            background-position: 100% 50%;
          }
          100% {
            background-position: 0% 50%;
          }
        }
        @keyframes swiping {
          0% {
            background-position: 0% 200%;
          }
          100% {
            background-position: 200% 200%;
          }
        }
        tooltip {
          background: #${palette.base00};
          border: 1px solid #${palette.base0E};
          border-radius: 10px;
        }
        tooltip label {
          color: #${palette.base07};
        }
        #window {
          color: #${palette.base03};
          background: #${palette.base00};
          margin: 6px 4px;
          border-radius: 15px;
          padding: 0px 10px;
        }
        #memory {
          color: #${palette.base0F};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #clock {
          color: #${palette.base0B};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #cpu {
          color: #${palette.base07};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #disk {
          color: #${palette.base03};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #battery {
          color: #${palette.base08};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #network {
          color: #${palette.base09};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #tray {
          color: #${palette.base05};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #pulseaudio {
          color: #${palette.base0D};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #custom-notification {
          color: #${palette.base0C};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #custom-themeselector {
          color: #${palette.base0D};
          background: #${palette.base00};
          margin: 6px 4px 6px 0px;
          padding: 0px 10px 0px 5px;
          border-radius: 0px 15px 15px 0px;
        }
        #custom-startmenu {
          color: #${palette.base03};
          background: #${palette.base00};
          margin: 6px 4px;
          padding: 0px 8px 0px 10px;
          border-radius: 15px;
        }
        #idle_inhibitor {
          color: #${palette.base09};
          background: #${palette.base00};
          margin: 6px 0px;
          padding: 0px 14px;
          border-radius: 0px;
        }
        #custom-exit {
          color: #${palette.base0E};
          background: #${palette.base00};
          margin: 6px 0px 6px 4px;
          padding: 0px 5px 0px 10px;
          border-radius: 15px 0px 0px 15px;
        }''
    ];
  };
}
