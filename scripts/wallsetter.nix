{ pkgs, ... }:

pkgs.writeShellScriptBin "wallsetter" ''
  # Timeout between wallpaper changes (in seconds)
  TIMEOUT=720

  # Kill any previously running instances of wallsetter
  for pid in $(pidof -o %PPID -x wallsetter); do
    kill $pid
  done

  # Check if the wallpaper directory exists
  WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
  if ! [ -d "$WALLPAPER_DIR" ]; then
    notify-send -t 5000 "Wallpaper directory '$WALLPAPER_DIR' does not exist." && exit 1
  fi

  # Ensure the wallpaper directory has more than one image
  if [ $(find "$WALLPAPER_DIR" -type f | wc -l) -lt 2 ]; then
    notify-send -t 9000 "The wallpaper folder is expected to have more than 1 image. Exiting Wallsetter." && exit 1
  fi

  PREVIOUS=""

  # Main loop to set wallpapers
  while true; do
    # Select a random wallpaper, ensuring it's not the same as the previous one
    while true; do
      WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
      if [ "$WALLPAPER" != "$PREVIOUS" ]; then
        break
      fi
    done

    PREVIOUS=$WALLPAPER

    # Use `swww` to set the wallpaper with a random transition
    ${pkgs.swww}/bin/swww img "$WALLPAPER" \
      --transition-type random \
      --transition-step 1 \
      --transition-fps 60

    # Wait before changing the wallpaper again
    sleep $TIMEOUT
  done
''
