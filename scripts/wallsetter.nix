{ pkgs, ... }:

pkgs.writeShellScriptBin "wallsetter" ''

  TIMEOUT=720
  WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

  for pid in $(pidof -o %PPID -x wallsetter); do
    kill $pid
  done

  # Initialize swww if not running
  if ! pgrep -x swww-daemon >/dev/null; then
    ${pkgs.swww}/bin/swww init
  fi

  if ! [ -d "$WALLPAPER_DIR" ]; then 
    notify-send -t 5000 "Wallpaper directory '$WALLPAPER_DIR' does not exist" 
    exit 1
  fi

  # Count actual files, excluding .git and hidden files
  FILE_COUNT=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f -not -path '*/\.*' | wc -l)
  if [ "$FILE_COUNT" -lt 2 ]; then
    notify-send -t 9000 "The wallpaper folder must have at least 2 images. Found: $FILE_COUNT" 
    exit 1
  fi

  PREVIOUS=""
  while true; do
    while true; do
      WALLPAPER=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f -not -path '*/\.*' | shuf -n 1)
      if [ "$WALLPAPER" != "$PREVIOUS" ]; then
        break
      fi
    done
    PREVIOUS="$WALLPAPER"
    ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type random --transition-step 1 --transition-fps 60
    sleep $TIMEOUT
  done
''
