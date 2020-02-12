#!/bin/sh
ROOT_DIR=~/dotfiles
ln -sfv $ROOT_DIR/.tmux.conf ~/.tmux.conf
ln -sfv $ROOT_DIR/bash/* ~/
ln -sfv $ROOT_DIR/zsh/* ~/
ln -sfv $ROOT_DIR/fish ~/.config/fish
ln -sfv $ROOT_DIR/.powerline-shell.json ~/.powerline-shell.json
ln -sfv $ROOT_DIR/.gitconfig ~/.gitconfig
ln -sfv $ROOT_DIR/.vim ~/
ln -sfv $ROOT_DIR/.vimrc ~/.vimrc
ln -sfv ${HOME}/.vim ~/.config/nvim
ln -snv ${HOME}/.vimrc ~/.config/nvim/init.vim
