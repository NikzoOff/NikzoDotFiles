#!/bin/bash

# Récupère les infos de la fenêtre active
info=$(hyprctl activewindow -j)
title=$(echo "$info" | jq -r '.title')
class=$(echo "$info" | jq -r '.class')

# Nettoyage par défaut
clean_title="$title"

case "$class" in
"kitty")
  # Si le titre est "cava - kitty", on garde "Kitty - cava"
  maincmd=$(echo "$title" | awk '{print $1}' | tr -d '─')
  clean_title="Kitty - $maincmd"
  ;;
"org.gnome.Nautilus" | "Nautilus")
  clean_title="Nautilus"
  ;;
"firefox" | "Google-chrome" | "chromium" | "Brave-browser")
  # Ex: "YouTube - Deezer" → garder la fin
  clean_title=$(echo "$title" | sed -E 's/.* - //')
  ;;
"nvim" | "nvim-qt" | "Neovim")
  clean_title="NeoVim"
  ;;
esac

echo "$clean_title"
