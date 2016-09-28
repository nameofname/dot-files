# set up variables
CURR_DATE=$(date +"%T")
DOT_FILES_DIR=$(pwd)

# update the value of $DOT_FILES_DIR in .bash_profile
echo "export DOT_FILES_DIR=$DOT_FILES_DIR" > /tmp/newfile
cat .bash_profile | grep -v "export DOT_FILES_DIR" >> /tmp/newfile
cp /tmp/newfile .bash_profile

# move existing copies of files out of the way without deleting
if [ -f ~/.bash_profile ]
    then mv ~/.bash_profile "~/.bash_profile.$CURR_DATE.BAK"
fi
if [ -f ~/.bash_aliases ] 
    then mv ~/.bash_aliases "~/.bash_aliases.$CURR_DATE.BAK"
fi
if [ -f ~/.vimrc ]
    then mv ~/.vimrc "~/.vimrc.$CURR_DATE.BAK"
fi

# sym-link the bash profile into place and source it. it will move the other files into place and source them
ln -s "${DOT_FILES_DIR}/.bash_profile" ~/
source ~/.bash_profile








