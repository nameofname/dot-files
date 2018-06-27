export DOT_FILES_DIR=/Users/ronald/projects/dot-files

# Import functions and aliases created in ~/.bash_alises file
if [ -f ~/.bash_aliases ]
    then rm ~/.bash_aliases
fi
ln -s "${DOT_FILES_DIR}/.bash_aliases" ~/
source ~/.bash_aliases

if [ -f ~/.vimrc ]
    then rm ~/.vimrc
fi
ln -s "${DOT_FILES_DIR}/.vimrc" ~/

# Use git tab completion.
if [ -f ~/git-completion.sh ]
    then rm ~/git-completion.sh;
fi
ln -s "${DOT_FILES_DIR}/git-completion.sh" ~/
. ~/git-completion.sh

# use secret keys file :
if [ -f ~/.secret_keys ]
    then
        source ~/.secret_keys
fi


# Fix for Node.js EMFILE error :
ulimit -S -n 2048

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
export CATALINA_HOME=/usr/local/Cellar/tomcat/7.0.29/libexec
export NODE_PATH=/usr/local/lib/node_modules/
export GOPATH=~/gocode
export PYTHONPATH=/usr/local/Cellar/pygtk/2.24.0
export SELENIUM_JAR=/usr/local/bin/selenium-server-standalone.jar
export PATH="/usr/local/sbin:$PATH" # adding sbin to PATH for brew
export PATH="$HOME/.jenv/bin:$PATH" # add jenv to PATH

eval "$(jenv init -)" 

# Set up terminal colors : 
function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export LSCOLORS=cxFxCxDxBxexexaxaxaxex
export CLICOLOR=1

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u$RED:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# works for home lap-top - does it work for work lap top as well ? 
export PATH="/usr/local/opt/php@5.6/bin:$PATH"
