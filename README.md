# dot-files

Just a simple space to keep my dot files up to date across machines. Steal whatever you like, ditch whatever you hate. 

- .bash_profile : basic setup, and sources other config files such as...
- .bash_aliases :  I throw handy functions in here for use at work / home. 
- .vimrc : I'm kind of particular about my vim setup, who isn't, am i right? 
- .secret_keys :  IMPORTANT - don't keep your protected bash vars in any of these committed files. to help manage that my bash profile checks for existence of ~/.secret_keys and sources if available. 
- git completion : a handy script I always keep in my home dir. it's separate because it's so long, i grabbed it from https://github.com/spearce


#SETUP : 

Setup will move any existing .bash_profile, .bash_aliases and .vimrc files out of the way and back them up in your home dir. 
It will udpate the location of the dot files directory (this repo) - and then sym link dot files into your home dir.

```sh
./setup.sh
source ~/.bash_profile
```


----

#A note on colors :

 The color designators used in LSCOLORS (bash_profile.sh) are as follows:

* a black
* b red
* c green
* d brown (yellow)
* e blue
* f magenta
* g cyan
* h light grey
* x default foreground or background

 NOTE* Colors a-h are available in bold using upper case letter designations

 The order of the attributes are as follows:

 1. directory
 2. symbolic link
 3. socket
 4. pipe
 5. executable
 6. block special
 7. character special
 8. executable with setuid bit set
 9. executable with setgid bit set
 10. directory writable to others, with sticky bit
 11. directory writable to others, without sticky bit
