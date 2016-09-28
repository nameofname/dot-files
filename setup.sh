CURR_DATE=$(date +"%T")
DOT_FILES_DIR=$(pwd)


if [ -f ~/.bash_profile ]
    then mv ~/.bash_profile "~/.bash_profile.$CURR_DATE.BAK"
fi
if [ -f ~/.bash_aliases ] 
    then mv ~/.bash_aliases "~/.bash_aliases.$CURR_DATE.BAK"
fi


ln -s "${DOT_FILES_DIR}/.bash_profile " ~/
echo "exports DOT_FILES_DIR=$DOT_FILES_DIR" >> .bash_profile

source ~/.bash_profile
#
#
#ln -s .bash_profile ~/
#ln -s .bash_aliases ~/
#








