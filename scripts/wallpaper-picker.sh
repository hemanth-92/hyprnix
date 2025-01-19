#!/usr/bin/env bash

# Define the wallpaper path where all wallpapers are stored
wallpaper_path="$HOME/Pictures/Wallpapers"

# Use 'ls' to list all files in the wallpaper directory and pass them to rofi for selection
wallpaper_name="$(ls "$wallpaper_path" | rofi -dmenu || pkill rofi)"

# Check if a wallpaper was selected and if the file exists
if [[ -f "$wallpaper_path/$wallpaper_name" ]]; then
    # Create a symbolic link to the selected wallpaper in the same path
    ln -sf "$wallpaper_path/$wallpaper_name" "$wallpaper_path/wallpaper"
    
    # Change the wallpaper using the wall-change command
    wall-change "$wallpaper_path/wallpaper"
else
    # Exit with an error if no wallpaper was selected or the file is not found
    exit 1
fi

