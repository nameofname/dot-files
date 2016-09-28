# set up variables
CURR_DATE=$(date +"%T")
DOT_FILES_DIR=$(pwd)

# update the value of $DOT_FILES_DIR in .bash_profile
echo "exports DOT_FILES_DIR=$DOT_FILES_DIR" > /tmp/newfile
cat .bash_profile >> /tmp/newfile
cp /tmp/newfile .bash_profile


if [ -f ~/.bash_profile ]
    then mv ~/.bash_profile "~/.bash_profile.$CURR_DATE.BAK"
fi
if [ -f ~/.bash_aliases ] 
    then mv ~/.bash_aliases "~/.bash_aliases.$CURR_DATE.BAK"
fi


ln -s "${DOT_FILES_DIR}/.bash_profile " ~/
echo "exports DOT_FILES_DIR=$DOT_FILES_DIR" >> .bash_profile

source ~/.bash_profile








