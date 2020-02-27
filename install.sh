#!/bin/sh
########################
# symbolic link
########################
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfv ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sfv ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sfv ~/dotfiles/zsh/.zsh_profile ~/.zsh_profile
ln -sfv ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/fish ~/.config
ln -sfv ~/dotfiles/.powerline-shell.json ~/.powerline-shell.json
ln -sfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -sfv ~/dotfiles/.vim ~/
ln -sfv ~/dotfiles/.vimrc ~/.vimrc
ln -sfv ~/dotfiles/.vim ~/.config/nvim
ln -snv ${HOME}/.vimrc ~/.config/nvim/init.vim
ln -sfv ${HOME}/.vim/coc-options.vim ~/.config/nvim/coc-options.vim
ln -sfv ${HOME}/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
