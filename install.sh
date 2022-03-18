#!/bin/sh

DEST="$HOME/.vimrc"
BACKUP="$DEST.backup.$(date +%s)"

if [ -f "$DEST" ] && [ ! -h "$DEST" ]; then
    printf 'Moving existing config to %s\n' "$BACKUP"
    mv "$DEST" "$BACKUP"
fi

printf 'Symlinking config to %s\n' "$DEST"
ln -sf "$PWD/.vimrc" "$DEST"
