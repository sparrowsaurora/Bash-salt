#!/bin/bash

# This is the install/startup script for the project

RED="\e[31m"
BLUE="\e[36m"
GREEN="\e[32m" # Success messages
BOLDBLUE="\e[1;36m" # File names 
ITALICRED="\e[3;31m" # Errors
ENDCOLOR="\e[0m" # Return

# echo -e "${ITALICRED}Error: $error_msg${ENDCOLOR}"

echo -e "\n${GREEN}Beginning setup ...${ENDCOLOR}"

# add aliases to .bashrc
file="test.txt"
touch $file
cat .bashrc > $file
sleep 0.1

echo -e "Base commands echoed to ${BOLDBLUE}$file${ENDCOLOR}\n"


echo "Choose what packages you would like."



function install_package() {
    local package_name="$1"
    read -p "Install $package_name? (Y/n): " response

    # Default Yes - check for response
    if [["$response" =~ ^[Yy]$ || -z "$response"]]; then
        echo "Installing ${BOLDBLUE}$package_name...${ENDCOLOR}"
        # actually install the package here
    else
        echo -e "${ITALICRED}Error: $error_msg${ENDCOLOR}"
    fi
}   

function install_all() {
    install_package "wordle"
    install_package "tree"
    install_package "todo"
}





