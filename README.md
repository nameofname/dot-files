# dot-files

Just a simple space to keep my dot files up to date across machines. Steal whatever you like, ditch whatever you hate. 

bash alias file :  I throw handy functions in here for use at work / home. 
bash profile : loads bash aliases, adds some environment properties that are not there by default. 

SETUP : 
```
cd ~/
curr_date=$(date +"%T")
mv ./.bash_profile "./.bash_profile.$curr_date.BAK"
mv ./.bash_aliases "./.bash_aliases.$curr_date.BAK"

ln -s ~/projects/dot-files/.bash_profile ~/
ln -s ~/projects/dot-files/.bash_aliases ~/

