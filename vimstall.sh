#!/usr/bin/env sh

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

if [[ -f $(which git) ]]; then
	git clone https://github.com/myusuf3/numbers.vim.git  ~/.vim/bundle/numbers
	git clone https://github.com/tpope/vim-sensible.git   ~/.vim/bundle/sensible
	git clone https://github.com/vim-airline/vim-airline  ~/.vim/bundle/airline
	git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
fi
