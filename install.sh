#!/usr/bin/env sh

dotfiles=(vimrc zshrc)

for dots in ${dotfiles[@]}; do
	echo $dots 
	cp "${dots}" "/home/hjf/.${dots}"
done
