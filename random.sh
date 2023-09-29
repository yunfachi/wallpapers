#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

current="${SCRIPT_DIR}/wallpapers/$(swww query | grep -oP 'image: \"\K[^\"]+' | head -1)"
files=($(find "${SCRIPT_DIR}"/wallpapers/ -type f))
files=(${files[@]/$current})

if [ ${#files[@]} -ge 1 ]; then
  random="${files[RANDOM % ${#files[@]}]}"
  swww img ${random}
else
  printf "it was not possible to change the wallpaper because it is either missing or such wallpaper is already installed"
fi
