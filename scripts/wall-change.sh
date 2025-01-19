#!/usr/bin/env bash

# Define available animations
animations=("outer" "center" "any" "wipe")

# Select a random animation
random_animation=${animations[RANDOM % ${#animations[@]}]}

# Apply the wallpaper with the selected animation
if [[ "$random_animation" == "wipe" ]]; then
    swww img --transition-type='wipe' --transition-angle=135 "$1" &
else
    swww img --transition-type="$random_animation" "$1" &
fi

