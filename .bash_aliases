alias locate_db="sudo launchctl load -w /system/library/launchdaemons/com.apple.locate.plist"

alias weather='curl wttr.in/new_york'

alias flushdns='sudo killall -HUP mDNSResponder'

alias lock="open -a /System/Library/Frameworks/ScreenSaver.framework//Versions/A/Resources/ScreenSaverEngine.app" 

alias size='du -sh'

alias physmem='top -l 1 -s 0 | grep PhysMem'

alias mgmobile='cd ~/projects/mecha-godzilla && mg -t @mobile-browse --config ./testConfigFiles/.localConfigrc -s local.intranet'

alias buildquery='pbpaste | xargs node -e "console.log(encodeURIComponent(process.argv[1]))" | xargs -I {} curl "https://www.1stdibs.com/soa/query-builder/1/search?uriRef={}" | jq '.''

alias remotebranch='git branch -r'

alias fixprettier='git diff HEAD --name-only --relative | xargs -I {} yarn prettier --write {}'

alias txt='pbpaste | pbcopy'

#docker aliases : 
alias dockerrm='docker ps -aq | xargs docker rm '

alias dockerrmi='docker images -aq | xargs docker rmi'

alias screendocker='screen /Users/ronald/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'

alias dockersh='docker exec -it dibs-php /bin/sh'

# Show and hide hidden files
alias show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder && open /System/Library/CoreServices/Finder.app'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder'

# Download all images associated with web page : 
alias download-img="wget -r -P ./download -A jpeg,jpg,bmp,gif,png"
alias download-all="wget -r -P ./download -A jpeg,jpg,bmp,gif,png,css,js"

alias vpnpw='echo $VPN_PW | tr -d "\n" | pbcopy'

# mega list command:
alias ls='ls -G'
alias ll='ls -lhi'
alias la='ls -lahi'

# stored locations
alias goenv='cd ~/projects/env-boot'
alias gogr='cd ~/projects/dibs-graphql'
alias goqb='cd ~/projects/dibs-query-builder'
alias gofe='cd ~/projects/ferrum'
alias goaf='cd ~/projects/ferrum/apps/app-buyer-finding'
alias godbl='cd ~/projects/ferrum/packages/dibs-buyer-layout'
alias gomg='cd ~/projects/mecha-godzilla'
alias gocloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias gorand='cd ~/projects/random-scripts/js/'

# GIT aliases
alias gf='git fetch'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --stat'
alias gdc='git diff --cached'
alias gdcs='git diff --cached --stat'
alias gl='git log -n5'

function gb() {
    read -rd '' b <<< "$1"
    git checkout -b nameofname/$b
}

function gco() {
    branch=$(node -e "const arg = process.argv[1]; console.log(arg.slice(0, 10) === 'nameofname' ? arg : \`nameofname/\${arg}\`)" $1)
    git checkout $branch
}

function gpo() {
    branch=$(branch)
    evalString="\
        const input = '$branch';
        const res = ['develop', 'master', 'release'].includes(input) || input.slice(0, 11) === 'nameofname/';
        if (res) { process.exit(0); }
        else { console.log('Invalid branch name $branch'); process.exit(1); }"
    node -e "$evalString" && git push origin $branch
}

function gr() {
    BRANCH=$(branch);
    # HAY=$(git branch -r);
    # if [[ $HAY = *"upstream/$BRANCH"* ]]; then
    #     REMOTE='upstream'; else
    #     REMOTE='origin';
    # fi
    # echo "pulling from $REMOTE $BRANCH";
    git pull --rebase origin $BRANCH;
}

# This function moved into .bash_provile to set up terminal colors : 
# function parse_git_branch () {
    # this is my version which also works
    # git branch | grep "*" | tr -d "* "
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

prettygit () {
	if [ -z "$1" ] 
	then
		echo "ERROR: Must provide a git hash"	
	else
		git show --pretty="format:" --name-only $1
	fi
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

function getip () {
    res=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
    printf $res | pbcopy
    echo $res
}

function branch () {
    res=$(git rev-parse --abbrev-ref HEAD)
    printf $res
}

# Note the usage of printf and echo - printf doesn't output a newline character
function getbranch () {
    res=$(branch)
    printf $res | pbcopy
    echo $res
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
function tarsomething() {
    cd ~/projects/
    tar -czf thing.tar.gz ./rollid_theme
}

function clearSolrItem() {
    IID=$1
    URL="http://mark:17007/inventory-3/1/solr/item/$IID?indexMode=sync"
    curl $URL -i
}

function curltimer() {
    url=$1
    curl -w "time_namelookup:  %{time_namelookup} \ntime_connect:  %{time_connect} \ntime_appconnect:  %{time_appconnect} \ntime_pretransfer:  %{time_pretransfer} \ntime_redirect:  %{time_redirect} \ntime_starttransfer:  %{time_starttransfer} \n---------- \ntime_total:  %{time_total}\n" -o /dev/null -s $url
}

function ngrep() {
    grep -ir "$1" . --exclude-dir={node_modules,.idea,.git,compiled,__snapshots__,__generated__,__fixtures__,.serverless,.yarn,.vscode,.next}
}

function sgrep() {
    find . -name src -type d | xargs -I {} grep -ir "$1" {} --exclude-dir=tst
}

function flushdbl() {
    ENV=$1
    URL="https://$ENV.1stdibs.com/fe-memcached/evict/buyer-layout/"
    echo "curling... $URL" && curl $URL
}

function pidfromport() {
    # lsof -nP -i4TCP:$1 | grep LISTEN
    lsof -n -i :$1 | grep LISTEN 
}

function getimgs() {
    ~/projects/random-scripts/bash/getImages.js $@;
}

# filterSize +80k | xargs -I {} echo {}
# file size indicators are are k M G T P and you can use + or - (ie - 1G)
function filterSize() {
    SIZE=$1
    find . -size $SIZE 
}

# eg. makegif 500 50 ./*.jpg 
# where 500 = resize value (max w/h)
# 50 = delay time (in hundredths of a second ie. 100 = 1 second)
function makegif() {
    size=$1
    delay=$2
    shift 2 # removes the first 2 arguments from $@ 
    files=$@
    echo "creating gif with ... size = $size, delay = $delay, files = $files"
    mkdir tmp
    cp $files ./tmp/
    cd tmp
    sips -Z $size $files 
    convert -delay $delay -loop 0 $files animated.gif
    mv animated.gif ../
    cd ../
    rm -r tmp
}

