#!/bin/zsh

# get all the values from collect-config.zsh and print them to one line, separated by spaces
# Path: .dotfiles/config/collect-config.zsh

function collectConfigFiles() {
    # get all the values from config-collection and print them to one line, separated by spaces

#    configPaths="${$(cat ./config-collection)/\~/$HOME}"
#    configPaths="cat ./config-collection"
    echo "copying the files in $configPaths to ~/.dotfiles/config/"

    # check that each file or folder exists
    # if it doesn't, print an error message and exit
#    for i in $configPaths
#    do
#        if [ ! -e $i ]
#        then
#            echo "Error: $i does not exist"
#            exit 1
#        fi
#    done

    # replace all the ~ with the home directory, using awk


    awk '{gsub("~", "'"$HOME"'", $0); print}' ./config-collection | xargs -I {} cp -r {} ~/.dotfiles/config/
    ls ~/.dotfiles/config/
}

collectConfigFiles