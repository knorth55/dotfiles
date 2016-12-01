#!/usr/bin/env bash

# get dotfiles path
dotfiles_path=$HOME/dotfiles
cd $dotfiles_path

# symbolic link
eval ln -sf  $dotfiles_path/bash/bashrc ~/.bashrc
eval ln -sf  $dotfiles_path/bash/bash_aliases ~/.bash_aliases
eval ln -sfn $dotfiles_path/bash_it ~/.bash_it
eval ln -sf  $dotfiles_path/git/gitconfig ~/.gitconfig
eval ln -sf  $dotfiles_path/vimrc ~/.vimrc
eval ln -sfn $dotfiles_path/vim ~/.vim 
eval ln -sfn $dotfiles_path/nvim ~/.config/nvim
eval ln -sf  $dotfiles_path/tmux.conf ~/.tmux.conf
eval ln -sfn $dotfiles_path/percol.d ~/.percol.d
eval ln -sf  $dotfiles_path/latex/latexmkrc ~/.latexmkrc

rlwrap_path="$dotfiles_path/rlwrap"
for filename in $(ls $rlwrap_path); do
    eval ln -sf $rlwrap_path/$filename ~/.$filename
done
# molokai
eval mkdir -p $dotfiles_path/vim/colors
eval mkdir -p $dotfiles_path/nvim/colors
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/vim/colors/molokai.vim 
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/nvim/colors/molokai.vim 

# fasd
if [ ! -d "$HOME/fasd" ]; then
  git clone https://github.com/clvv/fasd.git $HOME/fasd
  cd $HOME/fasd
  sudo make install
  cd $dotfiles_path
fi

# bash_it
cd $dotfiles_path
bash $dotfiles_path/install/install_bash_it.bash

source ~/.bashrc
