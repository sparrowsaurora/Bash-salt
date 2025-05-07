#!/bin/bash

# This is the install/startup script for the project

RED="\e[31m"
BLUE="\e[36m"
GREEN="\e[32m" # Success messages
BOLDBLUE="\e[1;36m" # File names 
ITALICRED="\e[3;31m" # Errors
ENDCOLOR="\e[0m" # Return

ALL_PACKAGES=("wordle" "tree" "todo")

# echo -e "${ITALICRED}Error: $error_msg${ENDCOLOR}"

# -----------------------
#  Function Definitions
# -----------------------

function install_package_request() {
    local install_all=false
    local force_install=false
    local package_name=""

    #parse options
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -a|--all) install_all=true ;;
            -f|--force) force_install=true ;;
            *) package_name="$1" ;;
        esac
        shift
    done

    if $install_all; then
        for item in "${ALL_PACKAGES[@]}"; do
            install_package -f "$item" # skip prompt
        done
        return
    fi

    if [[ -z "$package_name" ]]; then
        echo -e "${ITALICRED}Error: No package name provided and '-a' not used.${ENDCOLOR}"
        return 1
    fi

    local valid_package=false
    for item in "${ALL_PACKAGES[@]}"; do
        if [[ "$item" == "$package_name" ]]; then
            valid_package=true
            break
        fi
    done

    if ! $valid_package; then
        echo -e "${ITALICRED}Error: '$package_name' is not an available package${ENDCOLOR}"
        return 1
    fi

    if $force_install; then
        install_package_action $package_name
    else
        echo -n -e "Install ${BOLDBLUE}$package_name?${ENDCOLOR} (Y/n): "
        read response
        # Default Yes - check for response
        if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
            install_package_action $package_name
        else
            echo "Skipping $package_name"
            return
        fi
    fi
}

function install_package_action() {
    local package_name="$1"
    local sh_file="$package_name/$package_name.sh"
   
    echo -e "Installing ${BOLDBLUE}$package_name...${ENDCOLOR}"

    echo "Package files installing"
    cp -r $package_name ~/$package_name
    cat $sh_file > $file
    echo "Removing excess"
    rm $sh_file

    echo -e "${BOLDBLUE}$package_name${ENDCOLOR}${GREEN} successfully installed${ENDCOLOR}"
}

# -----------------------
#  Main
# -----------------------

# Start up
echo -e "\n${GREEN}Beginning setup ...${ENDCOLOR}"

# add aliases to .bashrc
file="test.txt"
touch $file
cat .bashrc > $file
sleep 0.1

echo -e "Base commands echoed to ${BOLDBLUE}$file${ENDCOLOR}\n"

# Choose Packages
echo "Choose what packages you would like."
read -p "Install all packages? (Y/n): " response
# Default Yes - check for response
if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
    install_package_request -a
else
    for package in ${ALL_PACKAGES[@]}; do
        install_package_request $package
    done
fi

# Offer Guide
read -p  "Would you like to download the docs? (Y/n): " response
# Default Yes - check for response
if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
    cp ./bash-salt_guide.md ~/bash-salt_guide.md
fi
    