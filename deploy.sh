#!/bin/bash

if command -v vim &> /dev/null; then
	ln -svf $HOME/git/config/.vimrc $HOME/.vimrc 
	mkdir -pv $HOME/.vim/autoload
	ln -svf $HOME/git/config/.vim/autoload/plug.vim $HOME/.vim/autoload/plug.vim
	mkdir -pv $HOME/.vim/syntax
	ln -fsv $HOME/git/config/.vim/syntax/*.vim $HOME/.vim/syntax/
fi

if command -v zsh &> /dev/null; then
	ln -svf $HOME/git/config/.zshrc $HOME/.zshrc
fi

if command -v tmux &> /dev/null; then
	ln -svf $HOME/git/config/.tmux.conf $HOME/.tmux.conf
fi
