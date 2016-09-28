# dot-files

Just a simple space to keep my dot files up to date across machines. Steal whatever you like, ditch whatever you hate. 

- .bash_profile : basic setup, and sources other config files such as...
- .bash_aliases :  I throw handy functions in here for use at work / home. 
- .vimrc : I'm kind of particular about my vim setup, who isn't, am i right? 
- .secret_keys :  IMPORTANT - don't keep your protected bash vars in any of these committed files. to help manage that my bash profile checks for existence of ~/.secret_keys and sources if available. 
- git completion : a handy script I always keep in my home dir. it's separate because it's so long, i grabbed it from https://github.com/spearce

SETUP : 
```

curr_date=$(date +"%T")
le_dir=$(pwd)

if [ -f ~/.bash_profile ] 
    then mv ~/.bash_profile "~/.bash_profile.$curr_date.BAK"
fi
if [ -f ~/.bash_aliases ] 
    then mv ~/.bash_aliases "~/.bash_aliases.$curr_date.BAK"
fi

ln -s "${le_dir}/bash_profile" ~/

