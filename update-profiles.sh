#!/bin/bash

### Name: Arkenfox user.js fast profile update
### Author: Bluudek
### Description: "Detects" user profile directories and copies all needed files from user.js directory (and any possible override files) into those.
### Version 1.0.0

### Additional info:
## For easier use of possible override files:
## - Create an override file with a name of the profile directory it's used for (with random prefixes used in directory names).
## - Put every override file into "~/.config/arkenfox/user-overrides/" directory (or replace the user_override_dir variable with your own default)
##
## !!! IT IS STRONGLY RECOMMENDED TO BACKUP PROFILES IN CASE SOMETHING BREAKS AND/OR YOU'D WANT TO REVERT THE CHANGES !!!

clear

# MAIN VARIABLES SECTION ############################
repo_url=https://github.com/arkenfox/user.js.git
repo_dir=~/Downloads/user.js
user_override_dir=~/.config/arkenfox/user-overrides/
#####################################################

if [ -e $repo_dir]; then
    echo "The user.js directory already exists!"
    rm -rf $repo_dir
fi

git clone $repo_url $repo_dir
cd $repo_dir

clear

echo "┌───────────────────────────────────┐"
echo "│   Arkenfox user.js fast updater   │"
echo "├───────────────────────────────────┘"
echo "├ [ $( firefox --version ) ]"
echo -e "└ [ Arkenfox user.js $( git describe --tags ) ]\n"


read -p "Do you wish to proceed? " strict_yn
relaxed_yn=${strict_yn:-$REPLY}
case $relaxed_yn in
    Yes | yes | Y | y ) start_script=1 ;;
    * ) rm -rf ~/Downloads/user.js ; exit;;
esac

echo -e "\n┌───────────────────────────────────┐"
echo      "│        Detecting profiles...      │"
echo      "└───────────────────────────────────┘"

profile_amount=0
for f in ~/.mozilla/firefox/*.*
do 
    if [ -d "${f}" ]; then
        ((profile_amount++))
        echo -e "\n┌[ ${f##*/} ]"
        cp ${repo_dir}/user.js ${repo_dir}/updater.sh ${repo_dir}/prefsCleaner.sh ${f}
        if [ -f ${user_override_dir}/${f##*/}.js ]; then
            echo "└ User overrides detected"
            cp ${user_override_dir}/${f##*/}.js ${f}/user-overrides.js
            $TERMINAL -e ${f}/updater.sh
        else
            echo "└ No user overrides detected"
        fi
        $TERMINAL -e ${f}/prefsCleaner.sh
        rm ${f}/updater.sh ${f}/prefsCleaner.sh
    fi
done

if [ $profile_amount < 1 ]; then
    echo -e "\n┌───────────────────────────────────┐"
    echo      "│         No profiles found         │"
    echo      "└───────────────────────────────────┘"
else
    echo -e "\n┌───────────────────────────────────┐"
    echo      "│   Profiles updated successfully   │"
    echo      "└───────────────────────────────────┘"
fi

rm -rf ~/Downloads/user.js