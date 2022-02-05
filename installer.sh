#!/bin/bash
mkdir -pv $HOME/.vim/autoload
ln -svf $HOME/Documents/config/.vim/autoload/plug.vim $HOME/.vim/autoload/plug.vim
ln -svf $HOME/Documents/config/.vimrc $HOME/.vimrc 
ln -svf $HOME/Documents/config/.zshrc $HOME/.zshrc
ln -svf $HOME/Documents/config/.tmux.conf $HOME/.tmux.conf
