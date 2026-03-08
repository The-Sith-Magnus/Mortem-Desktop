#!/usr/bin/env bash

DOTFILES="$HOME/Mortem-Desktop"
CONFIG="$HOME/.config"
BACKUP="$DOTFILES/backup"

mkdir -p "$BACKUP"

echo "Installing dotfiles..."

for dir in "$DOTFILES/config/"*; do
    name=$(basename "$dir")

    if [ -e "$CONFIG/$name" ] && [ ! -L "$CONFIG/$name" ]; then
        echo "Backing up $name"
        mv "$CONFIG/$name" "$BACKUP/"
    fi

    echo "Linking $name"
    ln -sfn "$dir" "$CONFIG/$name"
done

echo "Done."
