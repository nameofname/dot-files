export DOT_FILES_DIR=/Users/ronald/projects/dot-files

# Import functions and aliases created in ~/.bash_alises file
if [ -f ~/.bash_aliases ]
    then rm ~/.bash_aliases
fi
ln -s "${DOT_FILES_DIR}/.bash_aliases" ~
source ~/.bash_aliases

if [ -f ~/.vimrc ]
    then rm ~/.vimrc
fi
ln -s "${DOT_FILES_DIR}/.vimrc" ~

# OLD busted ass outdated git completion for bash
## Use git tab completion.
#if [ -f ~/git-completion.sh ]
#    then rm ~/git-completion.sh;
#fi
#ln -s "${DOT_FILES_DIR}/git-completion.sh" ~/
#. ~/git-completion.sh

# Updated git completion for zsh
zstyle ':completion:*:*:git:*' script ~/git-completion.bash
fpath=(~/.zsh $fpath)

# use secret keys file :
if [ -f ~/.secret_keys ]
    then
        source ~/.secret_keys
fi

# use amazon specific code
if [ -f ~/.amazon_profile ]
    then
        source ~/.amazon_profile
fi

# Fix for Node.js EMFILE error :
ulimit -S -n 2048

# Set up terminal colors : 
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | xargs
}

# colors:
export LSCOLORS=cxFxCxDxBxexexaxaxaxex
export CLICOLOR=1

# Old colors for bash : 
# RED="\[\033[0;31m\]"
# YELLOW="\[\033[0;33m\]"
# GREEN="\[\033[0;32m\]"
# NO_COLOUR="\[\033[0m\]"
# PS1="$GREEN\u$RED:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
setopt prompt_subst
export PROMPT='%F{yellow}%n %F{green}%~ %F{red}$(parse_git_branch) %f# '

export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/usr/local/bin/brew shellenv)"

# Python support : 
# This was messing up use of venv for me so I disabled for now
# pyenv global 2.7.18
alias python='python3' # On OSX python3 or python2 commands may exist but not python

# nvm support :
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# commented out NVM support to try out mise :
# eval "$(mise activate zsh)"

# Modifications to PATH :
export NODE_PATH=/usr/local/lib/node_modules/
export PATH="/usr/local/sbin:$PATH" # adding sbin to PATH for brew
export PATH="$PATH:$HOME/.toolbox/bin"
# PATH=$(pyenv root)/shims:$PATH # python globally available
#export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH" # openssl for brew
#export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

# Created by `pipx` on 2024-11-08 20:41:43
export PATH="$PATH:/Users/nameof/.local/bin"
