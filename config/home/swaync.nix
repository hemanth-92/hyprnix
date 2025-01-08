_:
{
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
            "timeout": 10,
            "timeout-low": 5,
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
                "buttons-grid",
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
                "buttons-grid": {
                    "actions": [
                        {
                            "label": "⏹️",
                            "command": "systemctl poweroff"
                        },
                        {
                            "label": "🔄",
                            "command": "systemctl reboot"
                        },
                        {
                            "label": "🚪",
                            "command": "hyprctl dispatch exit"
                        },
                        {
                            "label": "🗃️",
                            "command": "thunar"
                        },
                        {
                            "label": "📸",
                            "command": "gimp"
                        },
                        {
                            "label": "📣",
                            "command": "pactl set-sink-mute @DEFAULT_SINK@ toggle"
                        },
                        {
                            "label": "🎙️",
                            "command": "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
                        },
                        {
                            "label": "🎮",
                            "command": "steam"
                        },
                        {
                            "label": "🌏",
                            "command": "firefox"
                        },
                        {
                            "label": "📹",
                            "command": "obs"
                        }
                    ]
                }
        }
    }
  '';

  home.file.".config/swaync/style.css".text = ''
        * {
            font-family: Ubuntu;
            font-weight: bolder;
        }

    .control-center {
        background: #1e1e2e;
        border-top: 3px solid #94e2d5; /* Optional top border */
        border-bottom: 3px solid #94e2d5; /* Optional bottom border */
        border-left: none;
        border-right: none;
        border-radius: 0;
        box-shadow: 0px 0px 10px #585b70;
        height: 50%; /* Set height to half the screen */
        margin: auto; /* Center the notification panel vertically */
        position: absolute;
        top: 25%; /* Push it down to center vertically (50% height = 25% top margin) */
        left: 0;
        right: 0;
        width: 500px; /* Adjust the width if necessary */
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
            background: #1e1e2e;
            padding: 10px;
            border-radius: 5px;
            border: 2px solid #89b4fa;
            margin: 0;
        }

        .notification-default-action {
            margin: 0;
            padding: 0;
            border-radius: 5px;
        }

        .close-button {
            background: #f38ba8;
            color: #1e1e2e;
            text-shadow: none;
            padding: 0;
            border-radius: 5px;
            margin-top: 5px;
            margin-right: 5px;
        }

        .close-button:hover {
            box-shadow: none;
            background: #89b4fa;
            transition: all .15s ease-in-out;
            border: none;
        }

        .notification-action {
            border: 2px solid #89b4fa;
            border-top: none;
            border-radius: 5px;
        }

        .notification-default-action:hover,
        .notification-action:hover {
            color: #a6e3a1;
            background: #a6e3a1;
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
            background: #1e1e2e;
        }

        .notification-action:last-child {
            border-bottom-right-radius: 10px;
            background: #1e1e2e;
        }

        .inline-reply {
            margin-top: 8px;
        }

        .inline-reply-entry {
            background: #1e1e2e;
            color: #cdd6f4;
            caret-color: #cdd6f4;
            border: 1px solid #fab387;
            border-radius: 5px;
        }

        .inline-reply-button {
            margin-left: 4px;
            background: #1e1e2e;
            border: 1px solid #fab387;
            border-radius: 5px;
            color: #cdd6f4;
        }

        .inline-reply-button:disabled {
            background: initial;
            color: #45475a;
            border: 1px solid transparent;
        }

        .inline-reply-button:hover {
            background: #1e1e2e;
        }

        .body-image {
            margin-top: 6px;
            background-color: #cdd6f4;
            border-radius: 5px;
        }

        .summary {
            font-size: 16px;
            font-weight: 700;
            background: transparent;
            color: #a6e3a1;
            text-shadow: none;
        }

        .time {
            font-size: 16px;
            font-weight: 700;
            background: transparent;
            color: #cdd6f4;
            text-shadow: none;
            margin-right: 18px;
        }

        .body {
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            color: #cdd6f4;
            text-shadow: none;
        }

        .control-center {
            background: #1e1e2e;
            border: 2px solid #94e2d5;
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
  '';
}
