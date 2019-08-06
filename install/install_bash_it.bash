#!/usr/bin/env bash
export BASH_IT="$HOME/.bash_it"


if [ ! -d "$BASH_IT" ]; then
      git clone https://github.com/nwinkler/bash-it.git "$BASH_IT"
fi
  
source "$BASH_IT"/bash_it.sh

# alias
bash-it enable alias apt
bash-it enable alias emacs
bash-it enable alias git 
bash-it enable alias svn
bash-it enable alias tmux
bash-it enable alias vim

# plugins
bash-it enable plugin base
bash-it enable plugin git
bash-it enable plugin history
bash-it enable plugin hub
bash-it enable plugin latex
bash-it enable plugin pyenv
bash-it enable plugin python
bash-it enable plugin ssh
bash-it enable plugin tmux
bash-it enable plugin tmuxinator
bash-it enable plugin virtualenv

# completions
bash-it enable completion bash-it
bash-it enable completion git
bash-it enable completion hub
bash-it enable completion pip
bash-it enable completion ssh
bash-it enable completion tmux
