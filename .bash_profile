# Import functions and aliases created in ~/.bash_alises file 
if [ -f ~/.bash_aliases ] 
    then rm ~/.bash_aliases
fi
ln -s ~/projects/dot-files/.bash_aliases ~/
source ~/.bash_aliases

# Use git tab completion.
if [ -f ~/git-completion.sh ] 
    then rm ~/git-completion.sh;
fi
ln -s ~/projects/dot-files/git-completion.sh ~/
. ~/git-completion.sh

# Fix for Node.js EMFILE error : 
ulimit -S -n 2048

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
export CATALINA_HOME=/usr/local/Cellar/tomcat/7.0.29/libexec
export NODE_PATH=/usr/local/lib/node_modules/
export NODE_ENV=dev
export NODE_SERVICE_HOST=oathkeeper
export GOPATH=~/gocode
export PYTHONPATH=/usr/local/Cellar/pygtk/2.24.0
export HOMEBREW_GITHUB_API_TOKEN=ee881d564746b7bb59f70b625e5d3c2b91cfa458
export SELENIUM_JAR=/usr/local/bin/selenium-server-standalone.jar
export PATH="/usr/local/sbin:$PATH" # adding sbin to PATH for brew

# The color designators are as follows:
# a black
# b red
# c green
# d brown (yellow)
# e blue
# f magenta
# g cyan
# h light grey
# x default foreground or background
# NOTE* Colors a-h are available in bold using upper case letter designations
# 
# The order of the attributes are as follows:
# 1. directory
# 2. symbolic link
# 3. socket
# 4. pipe
# 5. executable
# 6. block special
# 7. character special
# 8. executable with setuid bit set
# 9. executable with setgid bit set
# 10. directory writable to others, with sticky bit
# 11. directory writable to others, without sticky bit

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

# use secret keys file : 
if [ -f ~/.secret_keys ] 
    then 
        source ~/.secret_keys
fi
