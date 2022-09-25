#!/bin/bash
#set working directory and go there
#change this variable to where you leave your AUR git folders
builds=/home/{username}/{whereever you put your AUR builds}
cd $builds
#this gets all the file names
declare -a allAurs

#iterate each directory 
for file in *
do 
    #verify its a directory (filters out files, like this one...)
    if [[ -d $file ]]; then
        #move working directory to aur folder
        cd $file;
        #check if file is up to date. if not it builds the package
        #and adds it to the aur update list
        if [ "$(git pull)" == "Already up to date." ]; then
        echo "${file} is up to date"
        else
        makepkg
        anAurs=$(ls | grep *.zst | xargs realpath )
        allAurs+=($anAurs)
        fi
        #backout of the directory back to set working directory, to repeat
        cd ..
    fi
done 

#if there are any items in the allAurs array it will prompt to update
#otherwise it will let you know you are up to date
if [ ${#allAurs[@]} -gt 0 ]; then
    #inform user and only update with a capital Y
    echo "There are ${#allAurs[@]} AURs awaiting install:"
    printf '%s\n' ${allAurs[@]}
    echo "install (update) all?[Y/n]"
    read decide
    if [ $decide == "Y" ]; then
        #update is each .zst file that will be installed.
        #this iterates over all of them and installs
        for update in $allAurs
        do
            sudo pacman -U $update
        done
        #after iterating this goes back to builds directory
        cd $builds
        #then iterates and cleans the now unneeded install files
        for file in *
        do
            if [[ -d $file ]]; then
            cd $file
            git clean -dfx
            cd ..
            fi
        done
    else
        #user should only see this if they decide to backout
        #of the update for whatever reason
        #--- feature consideration -- 
        #   may want to clear directories OR modify update script 
        #   to allow for checking for pre-existing .zst files?
        echo "update aborted. Have a good one"
    fi
else
    #lets the user know there is nothing to do
    echo "You are all up to date it would appear"
fi
