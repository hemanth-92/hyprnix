{ pkgs, ... }:

{
  home.packages = with pkgs; [ swaynotificationcenter ];
  home.file.".config/swaync/config.json".text = ''
    {
      "$schema": "/etc/xdg/swaync/configSchema.json",
      "positionX": "right",
      "positionY": "top",
      "control-center-margin-top": 10,
      "control-center-margin-bottom": 10,
      "control-center-margin-right": 10,
      "control-center-margin-left": 10,
      "notification-icon-size": 64,
      "notification-body-image-height": 100,
      "notification-body-image-width": 200,
      "timeout": 2,
      "timeout-low": 2,
      "timeout-critical": 0,
      "fit-to-screen": false,
      "control-center-width": 500,
      "control-center-height": 1025,
      "notification-window-width": 500,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": false,
      "hide-on-action": true,
      "script-fail-notify": true,
      "widgets": [
        "title",
        "mpris",
        "volume",
        "backlight",
        "dnd",
        "notifications"
      ],
      "widget-config": {
        "title": {
          "text": "Notification Center",
          "clear-all-button": true,
          "button-text": "󰆴 Clear All"
        },
        "dnd": {
          "text": "Do Not Disturb"
        },
        "label": {
          "max-lines": 1,
          "text": "Notification Center"
        },
        "mpris": {
          "image-size": 96,
          "image-radius": 7
        },
        "volume": {
          "label": "󰕾"
        },
        "backlight": {
          "label": "󰃟"
        },
      }
    }
  '';
  home.file.".config/swaync/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
    }
    .control-center .notification-row:focus,
    .control-center .notification-row:hover {
      opacity: 0.9;
      background: #1E1E2E;
    }
    .notification-row {
      outline: none;
      margin: 10px;
      padding: 0;
    }
    .notification {
      background: transparent;
      padding: 0;
      margin: 0px;
    }
    .notification-content {
      background: #1E1E2E;
      padding: 10px;
      border-radius: 5px;
      border: 2px solid #89B4FA;
      margin: 0;
    }
    .notification-default-action {
      margin: 0;
      padding: 0;
      border-radius: 5px;
    }
    .close-button {
      background: #F38BA8;
      color: #1E1E2E;
      text-shadow: none;
      padding: 0;
      border-radius: 5px;
      margin-top: 5px;
      margin-right: 5px;
    }
    .close-button:hover {
      box-shadow: none;
      background: #89B4FA;
      transition: all .15s ease-in-out;
      border: none;
    }
    .notification-action {
      border: 2px solid #89B4FA;
      border-top: none;
      border-radius: 5px;
    }
    .notification-default-action:hover,
    .notification-action:hover {
      color: #ABE9B3;
      background: #ABE9B3;
    }
    .notification-default-action {
      border-radius: 5px;
      margin: 0px;
    }
    .notification-default-action:not(:only-child) {
      border-bottom-left-radius: 7px;
      border-bottom-right-radius: 7px;
    }
    .notification-action:first-child {
      border-bottom-left-radius: 10px;
      background: #1E1E2E;
    }
    .notification-action:last-child {
      border-bottom-right-radius: 10px;
      background: #1E1E2E;
    }
    .inline-reply {
      margin-top: 8px;
    }
    .inline-reply-entry {
      background: #1E1E2E;
      color: #CDD6F4;
      caret-color: #CDD6F4;
      border: 1px solid #F8BD96;
      border-radius: 5px;
    }
    .inline-reply-button {
      margin-left: 4px;
      background: #1E1E2E;
      border: 1px solid #F8BD96;
      border-radius: 5px;
      color: #CDD6F4;
    }
    .inline-reply-button:disabled {
      background: initial;
      color: #585B70;
      border: 1px solid transparent;
    }
    .inline-reply-button:hover {
      background: #1E1E2E;
    }
    .body-image {
      margin-top: 6px;
      background-color: #CDD6F4;
      border-radius: 5px;
    }
    .summary {
      font-size: 16px;
      font-weight: 700;
      background: transparent;
      color: rgba(158, 206, 106, 1);
      text-shadow: none;
    }
    .time {
      font-size: 16px;
      font-weight: 700;
      background: transparent;
      color: #CDD6F4;
      text-shadow: none;
      margin-right: 18px;
    }
    .body {
      font-size: 15px;
      font-weight: 400;
      background: transparent;
      color: #CDD6F4;
      text-shadow: none;
    }
    .control-center {
      background: #1E1E2E;
      border: 2px solid #89DCEB;
      border-radius: 5px;
    }
    .control-center-list {
      background: transparent;
    }
    .control-center-list-placeholder {
      opacity: .5;
    }
    .floating-notifications {
      background: transparent;
    }
    .blank-window {
      background: alpha(black, 0);
    }
    .widget-title {
      color: #ABE9B3;
      background: #1E1E2E;
      padding: 5px 10px;
      margin: 10px 10px 5px 10px;
      font-size: 1.5rem;
      border-radius: 5px;
    }
    .widget-title>button {
      font-size: 1rem;
      color: #CDD6F4;
      text-shadow: none;
      background: #1E1E2E;
      box-shadow: none;
      border-radius: 5px;
    }
    .widget-title>button:hover {
      background: #F38BA8;
      color: #1E1E2E;
    }
    .widget-dnd {
      background: #1E1E2E;
      padding: 5px 10px;
      margin: 10px 10px 5px 10px;
      border-radius: 5px;
      font-size: large;
      color: #ABE9B3;
    }
    .widget-dnd>switch {
      border-radius: 5px;
      background: #ABE9B3;
    }
    .widget-dnd>switch:checked {
      background: #F38BA8;
      border: 1px solid #F38BA8;
    }
    .widget-dnd>switch slider {
      background: #1E1E2E;
      border-radius: 5px;
    }
    .widget-dnd>switch:checked slider {
      background: #1E1E2E;
      border-radius: 5px;
    }
    .widget-label {
      margin: 10px 10px 5px 10px;
    }
    .widget-label>label {
      font-size: 1rem;
      color: #CDD6F4;
    }
    .widget-mpris {
      color: #CDD6F4;
      padding: 5px 10px;
      margin: 10px 10px 5px 10px;
      border-radius: 5px;
    }
    .widget-mpris > box > button {
      border-radius: 5px;
    }
    .widget-mpris-player {
      padding: 5px 10px;
      margin: 10px;
    }
    .widget-mpris-title {
      font-weight: 700;
      font-size: 1.25rem;
    }
    .widget-mpris-subtitle {
      font-size: 1.1rem;
    }
    .widget-menubar>box>.menu-button-bar>button {
      border: none;
      background: transparent;
    }
    .topbar-buttons>button {
      border: none;
      background: transparent;
    }
    .widget-volume {
      background: #181825;
      padding: 5px;
      margin: 10px 10px 5px 10px;
      border-radius: 5px;
      font-size: x-large;
      color: #CDD6F4;
    }
    .widget-volume>box>button {
      background: #ABE9B3;
      border: none;
    }
    .per-app-volume {
      background-color: #1E1E2E;
      padding: 4px 8px 8px;
      margin: 0 8px 8px;
      border-radius: 5px;
    }
    .widget-backlight {
      background: #181825;
      padding: 5px;
      margin: 10px 10px 5px 10px;
      border-radius: 5px;
      font-size: x-large;
      color: #CDD6F4;
    }
  '';
}
