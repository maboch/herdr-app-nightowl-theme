#!/usr/bin/env sh
# Install the Night Owl theme for Herdr.
# Usage: ./install.sh [--apply]
#   --apply   also switch the running window's current layout to nightowl
set -eu

here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
home=${HERDR_APP_HOME:-"$HOME/.config/herdr-app"}
theme_src="$here/themes/nightowl.json"
theme_dst="$home/themes/nightowl.json"
apply=no

for arg in "$@"; do
  case "$arg" in
    --apply) apply=yes ;;
    -h|--help)
      cat <<'USAGE'
Install the Night Owl theme for Herdr.
Usage: ./install.sh [--apply]
  --apply   also switch the running window's current layout to nightowl
USAGE
      exit 0 ;;
    *)
      echo "unknown argument: $arg" >&2
      exit 2 ;;
  esac
done

mkdir -p "$home/themes"
cp "$theme_src" "$theme_dst"
echo "Installed Night Owl theme: $theme_dst"

if [ "$apply" = yes ]; then
  if ! command -v herdr-app >/dev/null 2>&1; then
    echo "herdr-app is not on PATH; open Herdr and pick 'nightowl' in the theme menu." >&2
    exit 0
  fi
  if ! herdr-app status >/dev/null 2>&1; then
    echo "Herdr is not running; start it and pick 'nightowl' in the theme menu." >&2
    exit 0
  fi
  herdr-app do app.theme --name nightowl >/dev/null
  echo "Applied nightowl to the current layout."
else
  echo "Pick 'nightowl' in Herdr's theme menu (Settings > Appearance)."
  echo "To apply it to the running window now: $0 --apply"
fi
