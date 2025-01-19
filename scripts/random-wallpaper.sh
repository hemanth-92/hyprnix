#!/usr/bin/env bash

# Define the directory containing wallpapers
wallpaper_path="$HOME/Pictures/Wallpapers"

# Loop to change wallpaper every minute
while true; do
    echo "Starting wallpaper change process..."

    # Get the current wallpaper symlink
    current_wallpaper=$(readlink "$wallpaper_path/wallpaper" 2> /dev/null)
    current_wallpaper_name="$(basename "$current_wallpaper")"
    
    # Log the current wallpaper
    echo "Current wallpaper: $current_wallpaper_name"

    # Use 'mapfile' to safely read all wallpaper filenames into an array
    mapfile -t wallpaper_list < <(find "$wallpaper_path" -type f)

    # Get the count of wallpapers
    wallpaper_count=${#wallpaper_list[@]}

    # Ensure there are wallpapers to select from
    if (( wallpaper_count == 0 )); then
        echo "No wallpapers found in $wallpaper_path"
        exit 1
    fi

    # Select a new wallpaper that is not the current one
    while true; do
        wallpaper_name="${wallpaper_list[RANDOM % wallpaper_count]}"

        # If the selected wallpaper is not the current one, break the loop
        if [[ "$(basename "$wallpaper_name")" != "$current_wallpaper_name" ]]; then
            echo "Selected wallpaper: $(basename "$wallpaper_name")"
            break
        fi
    done

    # Update the symlink to the new wallpaper
    echo "Updating symlink..."
    ln -sf "$wallpaper_name" "$wallpaper_path/wallpaper"

    # Log the symlink update
    echo "Symlink updated to: $wallpaper_path/wallpaper -> $wallpaper_name"

    # Change the wallpaper using wall-change (assumes it's a valid tool)
    echo "Changing wallpaper..."
    wall-change "$wallpaper_path/wallpaper" &

    # Wait for 60 seconds before changing the wallpaper again
    echo "Waiting for 60 seconds before changing wallpaper again..."
    sleep 60
done
