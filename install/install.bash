#!/usr/bin/env bash

# get dotfiles path
dotfiles_path=$HOME/dotfiles
cd $dotfiles_path

# symbolic link
eval ln -sf  $dotfiles_path/bash/bashrc ~/.bashrc
eval ln -sf  $dotfiles_path/bash/bash_aliases ~/.bash_aliases
eval ln -sf  $dotfiles_path/bash/bash_profile ~/.bash_profile
eval ln -sfn $dotfiles_path/bash_it ~/.bash_it
eval ln -sf  $dotfiles_path/git/gitconfig ~/.gitconfig
eval ln -sf  $dotfiles_path/git/gitignore_global ~/.gitignore_global
eval ln -sf  $dotfiles_path/vimrc ~/.vimrc
eval ln -sfn $dotfiles_path/vim ~/.vim 
eval ln -sfn $dotfiles_path/nvim ~/.config/nvim
eval ln -sf  $dotfiles_path/tmux.conf ~/.tmux.conf
eval ln -sfn  $dotfiles_path/tmux ~/.tmux
eval ln -sfn $dotfiles_path/percol.d ~/.percol.d
eval ln -sf  $dotfiles_path/latex/latexmkrc ~/.latexmkrc
eval ln -sf  $dotfiles_path/xinitrc ~/.xinitrc
eval ln -sf  $dotfiles_path/Xmodmap ~/.Xmodmap

rlwrap_path="$dotfiles_path/rlwrap"
for filename in $(ls $rlwrap_path); do
    eval ln -sf $rlwrap_path/$filename ~/.$filename
done
# molokai
eval mkdir -p $dotfiles_path/vim/colors
eval mkdir -p $dotfiles_path/nvim/colors
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/vim/colors/molokai.vim 
eval curl -s https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o $dotfiles_path/nvim/colors/molokai.vim 

# # ccache
# if [ ! $(which "ccache") ]; then
#   echo "[ccache] sudo apt-get install ccache"
#   sudo apt-get install -y ccache
# fi

# # pip
# if [ $(dpkg -s "python-pip" &> /dev/null) ]; then
#   echo "[pip] sudo apt-get purge python-pip"
#   sudo apt-get purge python-pip
# fi
# if [ ! $(which "pip") ]; then
#   pushd $HOME/Downloads
#   if [ ! -d "$HOME/Downloads/get-pip.py" ]; then
#     wget https://bootstrap.pypa.io/get-pip.py
#   fi
#   echo "[pip] python get-pip.py"
#   sudo python get-pip.py
#   popd
# fi

# percol
if [ ! $(which "percol") ]; then
  echo "[percol] sudo pip install percol"
  sudo pip install percol
fi

# pycd
if [ ! $(which "pycd") ]; then
  echo "[pycd] sudo pip install pycd"
  sudo pip install pycd
fi

# bash_it
cd $dotfiles_path
bash $dotfiles_path/install/install_bash_it.bash

source ~/.bashrc
