#!/bin/bash
mkdir -pv $HOME/.vim/autoload
ln -sv $HOME/Documents/config/.vim/autoload/plug.vim $HOME/.vim/autoload/plug.vim
ln -sv $HOME/Documents/config/.vimrc $HOME/.vimrc 
ln -sv $HOME/Documents/config/.zshrc $HOME/.zshrc
ln -sv $HOME/Documents/config/.tmux.conf $HOME/.tmux.conf
