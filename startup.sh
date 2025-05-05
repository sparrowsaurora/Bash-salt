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

echo -e "\n${GREEN}Beginning setup ...${ENDCOLOR}"

# add aliases to .bashrc
file="test.txt"
touch $file
cat .bashrc > $file
sleep 0.1

echo -e "Base commands echoed to ${BOLDBLUE}$file${ENDCOLOR}\n"

function install_package() {
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
            sleep 0.05
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
        echo -e "Installing ${BOLDBLUE}$package_name...${ENDCOLOR}"
        # actually install the package here
        echo -e "${BOLDBLUE}$package_name${ENDCOLOR}${GREEN} successfully installed${ENDCOLOR}"
    else
        echo -n -e "Install ${BOLDBLUE}$package_name?${ENDCOLOR} (Y/n): "
        read response
        # Default Yes - check for response
        if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
            echo -e "Installing ${BOLDBLUE}$package_name...${ENDCOLOR}"
            # actually install the package here
            echo -e "${BOLDBLUE}$package_name${ENDCOLOR}${GREEN} successfully installed${ENDCOLOR}"
        else
            echo "Skipping $package_name"
            return
        fi
    fi
}

echo "Choose what packages you would like."
read -p "Install all packages? (Y/n): " response
# Default Yes - check for response
if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
    install_package -a
else
    install_package "tree"
fi


