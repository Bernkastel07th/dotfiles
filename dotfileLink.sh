#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.zsh_profile ~/.zsh_profile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vim ~/
ln -sf ~/dotfiles/.powerline-shell.json ~/.powerline-shell.json
ln -snfv ${HOME}/.vim/* ${HOME}/.config/nvim
ln -snfv ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
