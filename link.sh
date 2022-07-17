#!/usr/bin/env bash

echo "Linking neovim"
ln -s $(pwd)/nvim ~/.config/nvim

echo "Linking tmux"
ln -s $(pwd)/tmux.conf ~/.tmux.conf

echo "Linking zshrc"
ln -s $(pwd)/shell/zshrc ~/.zshrc
