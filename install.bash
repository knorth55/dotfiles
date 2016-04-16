#::!/usr/bin/env bash

# get dotfiles path
dotfiles_path=$(cd $(dirname $0) && pwd)

# symbolic link
eval ln -sf  $dotfiles_path/bashrc ~/.bashrc
eval ln -sf  $dotfiles_path/bash_aliases ~/.bash_aliases
eval ln -sfn $dotfiles_path/bash_it ~/.bash_it
eval ln -sf  $dotfiles_path/gitconfig ~/.gitconfig
eval ln -sf  $dotfiles_path/vimrc ~/.vimrc
eval ln -sfn $dotfiles_path/vim ~/.vim 
eval ln -sfn $dotfiles_path/nvim ~/.config/nvim
eval ln -sf  $dotfiles_path/tmux.conf ~/.tmux.conf
eval ln -sfn $dotfiles_path/percol.d ~/.percol.d

rlwrap_path="$dotfiles_path/rlwrap"
for filename in $(ls $rlwrap_path); do
    eval ln -sf $rlwrap_path/$filename ~/.$filename
done
# molokai
eval mkdir -p $dotfiles_path/vim/colors
eval mkdir -p $dotfiles_path/nvim/colors
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/vim/colors/molokai.vim 
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/nvim/colors/molokai.vim 
