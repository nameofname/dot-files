alias locate_db="sudo launchctl load -w /system/library/launchdaemons/com.apple.locate.plist"

# Show and hide hidden files
alias show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder && open /System/Library/CoreServices/Finder.app'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder'

alias weather='curl wttr.in/new_york'

alias flushdns='sudo killall -HUP mDNSResponder'

alias lock="open -a /System/Library/Frameworks/ScreenSaver.framework//Versions/A/Resources/ScreenSaverEngine.app" 

alias size='du -sh'

alias physmem='top -l 1 -s 0 | grep PhysMem'

alias mgmobile='cd ~/projects/mecha-godzilla && mg -t @mobile-browse --config ./testConfigFiles/.localConfigrc -s local.intranet'

# mega list command:
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'

alias godibs='cd ~/projects/1stdibs.com'
alias gov2='cd ~/projects/1stdibs-admin-v2'
alias gov1='cd ~/projects/1stdibs-admin-v1'
alias gobunsen='cd ~/projects/1stdibs-admin-v2/node_modules/bunsen'
alias gopan='cd ~/projects/my_pantry'
alias goim='cd ~/projects/dibs-internal-inventory-management'
alias goaf='cd ~/projects/app-buyer-finding'
alias gogr='cd ~/projects/dibs-graphql'
alias godbl='cd ~/projects/dibs-buyer-layout'
alias goqb='cd ~/projects/dibs-query-builder'
alias gomg='cd ~/projects/mecha-godzilla'
govag () {
    godibs 
    vagrant ssh 
}

# GIT aliases
alias gf='git fetch'
# alias gr='BRANCH=$(branch)  && git remote | grep upstream && { REMOTE="upstream"; } || { REMOTE="origin"; } && git pull --rebase $REMOTE $BRANCH'
#alias gr='BRANCH=$(branch)  && git branch -r | grep $BRANCH | grep upstream && { REMOTE="upstream"; } || { REMOTE="origin"; } && git pull --rebase $REMOTE $BRANCH'
gr() {
    BRANCH=$(branch);
    HAY=$(git branch -r);
    if [[ $HAY = *"upstream/$BRANCH"* ]]; then
        REMOTE='upstream'; else
        REMOTE='origin';
    fi
    echo "pulling from $REMOTE $BRANCH";
    git pull --rebase $REMOTE $BRANCH;
}
alias gru='branch | git pull --rebase upstream'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --stat'
alias gdc='git diff --cached'
alias gdcs='git diff --cached --stat'
alias gl='git log -n5'

alias fixprettier='git diff HEAD --name-only | xargs -I {} yarn prettier --write {}'

# Set up terminal colors : 
function parse_git_branch () {
    # this is my version which also works
    # git branch | grep "*" | tr -d "* "
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Download all images associated with web page : 
alias download-img="wget -r -P ./download -A jpeg,jpg,bmp,gif,png"
alias download-all="wget -r -P ./download -A jpeg,jpg,bmp,gif,png,css,js"
prettygit () {
	if [ -z "$1" ] 
	then
		echo "ERROR: Must provide a git hash"	
	else
		git show --pretty="format:" --name-only $1
	fi
}

grepstatic () {
    grep -r $1 /var/www/html/public/templates/
    grep -r $1 /var/www/html/src/
    grep -r $1 /var/www/html/application/views/
    grep -r $1 /var/www/html/vendor/1stdibs/
}

grepv2 () {
    cd ~/projects/1stdibs-admin-v2/
    grep -r $1 ./application/
    grep -r $1 ./public/
    grep -r $1 ./src/
    grep -r $1 ./app/
    grep -r $1 ./node_modules/bunsen/
}

updatevag() {
    cd ~/projects/1stdibs.com/
    vagrant ssh -c "puppet agent --no-daemonize --verbose --onetime"
}

# Opens a new tab... sweet!
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    #tell application "Terminal"
    #  activate
    #  do script with command "cd \"$PWD\"; $*" in window 1
    #end tell
EOF
}

# Utility method to unzip AHYTHING!
# I think this was from Tim Adams... this looks so rediculously useful!!!
function x () {
  if [ -f $1 ] ; then
    case $1 in
    *.tar.bz2)   tar xjf $1 ;;
    *.tar.gz)    tar xzf $1 ;;
    *.bz2)       bunzip2 $1 ;;
    *.rar)       rar x $1 ;;
    *.gz)        gunzip $1 ;;
    *.tar)       tar xvf $1 ;;
    *.tbz2)      tar xjf $1 ;;
    *.tgz)       tar xzf $1 ;;
    *.zip)       unzip $1 ;;
    *.Z)         uncompress $1 ;;
    *.7z)        7za x $1 ;;
    *.xz)        xz -d $1 ;;
    *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
    fi
}

alias txt='pbpaste | pbcopy'

function _print() {
    echo "$1" | tr -d ' |\n'
    printf '\n'
}

function getip () {
    res=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
    echo $res | tr -d '\n' | pbcopy
    _print $res
}

branch () {
    res=$(git rev-parse --abbrev-ref HEAD)
    echo $res | tr -d '\n' 
}

getbranch () {
    res=$(branch)
    echo $res | pbcopy
    _print $res
}

startv2 () {
  if [ -z $1 ] ; then
      echo 'You must provide an environment variable (ie. "qa").' 
  else
    gov2
    # NODE_ENV=$1; NODE_SERVICE_HOST=https://$1 node app/index.js
    NODE_SERVICE_HOST=http://$1 node app/index.js
  fi
}

alias startreporting='cd ~/projects/dibs-reporting-service; NODE_SERVICE_HOST=qa NODE_DB_HOST=oathkeeper NODE_DB_USER=engineering NODE_DB_PW=$DB_PW node index.js'
alias startreportingprod='cd ~/projects/dibs-reporting-service; NODE_SERVICE_HOST=bulleit NODE_DB_HOST=vox NODE_DB_USER=engineering NODE_DB_PW=$DB_PW node index.js'

alias startiim='cd ~/projects/dibs-internal-inventory-management; NODE_SERVICE_HOST=qa node app.js'

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Eval a command line input and console log the output in Node.js. 
# The input is provided as the variable "input" to your script 
# Handy for in-line use :
# EXample : 
#       echo flerp | node-eval 'input.split("e")[1]' //echoes 'rp'
# Also useful for eval-ing bash input via some node script you wrote :
# Example : 
#       cat ./file.txt | node-eval script.js
function node-eval () {
    if [ -f $1 ] ; then
        __nodeevaltmpstr=$(cat $1)
        __nodeevalstr="var input = process.argv[1]; $__nodeevaltmpstr"
        node -e "$__nodeevalstr" "$(cat)"
    else 
        __nodeevaltmpstr=$1
        __nodeevalstr="var input = process.argv[1]; console.log($__nodeevaltmpstr)"
        node -e "$__nodeevalstr" "$(cat)"
    fi
}


# Testing out tar from bash function -- I was unable to use tar in my bash script... 
tarsomething() {
    cd ~/projects/
    tar -czf thing.tar.gz ./rollid_theme
}

gpo() {
    branch=$(branch)
    git push origin $branch
}

clearSolrItem() {
    IID=$1
    URL="http://mark:17007/inventory-3/1/solr/item/$IID?indexMode=sync"
    curl $URL -i
}

curltimer() {
    url=$1
    curl -w "time_namelookup:  %{time_namelookup} \ntime_connect:  %{time_connect} \ntime_appconnect:  %{time_appconnect} \ntime_pretransfer:  %{time_pretransfer} \ntime_redirect:  %{time_redirect} \ntime_starttransfer:  %{time_starttransfer} \n---------- \ntime_total:  %{time_total}\n" -o /dev/null -s $url
}

ngrep() {
    grep -ir $1 . --exclude-dir={node_modules,.idea,.git,*compiled} | grep -v "__snapshots__\|__generated__\|__fixtures__"
}

alias dockerrm='docker ps -aq | xargs docker rm '
alias dockerrmi='docker images -aq | xargs docker rmi'
alias screendocker='screen /Users/ronald/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'
alias dockersh='docker exec -it dibs-php /bin/sh'

alias buildquery='pbpaste | xargs node -e "console.log(encodeURIComponent(process.argv[1]))" | xargs -I {} curl "https://www.1stdibs.com/soa/query-builder/1/search?uriRef={}" | jq '.''

flushdbl() {
    ENV=$1
    URL="https://$ENV.1stdibs.com/evict/buyer-layout/"
    echo "curling... $URL" && curl $URL
}

pidFromPort() {
    lsof -nP -i4TCP:$1 | grep LISTEN
}
