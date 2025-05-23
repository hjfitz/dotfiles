#!/usr/bin/env bash

echo "Linking neovim"
ln -s $(pwd)/nvim ~/.config/nvim || echo 'Already linked nvim'

echo "Linking tmux"
ln -s $(pwd)/tmux.conf ~/.tmux.conf

echo "Linking zshrc"
ln -s $(pwd)/shell/zshrc ~/.zshrc
ln -s $(pwd)/shell/telemetry.sh ~/.telemetry.sh

ln -s $(pwd)/shell/rg.conf ~/.rg.conf

# WSL doesn't like symlinks here for some reason?
echo "Initialising scripts"
for file in bin/*; do
	cp $file ~/.bin/$(basename "$file")
done
