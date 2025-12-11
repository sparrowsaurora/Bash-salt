#!/bin/bash

set -e  # exit on error

# This is the install/startup script for the project

# -----------------------
#  Color Definitions
# -----------------------
RED="\e[31m"
BLUE="\e[36m"
GREEN="\e[32m" # Success messages
BOLDBLUE="\e[1;36m" # File names
ITALICRED="\e[3;31m" # Errors
ENDCOLOR="\e[0m" # Return
# Example: echo -e "${ITALICRED}Error: $error_msg${ENDCOLOR}"

# -----------------------
#  Configuration
# -----------------------

CONFIG_FILE="./test/config.json" # path to config file - TEST FOR NOW
ALL_PACKAGES=("wordle" "tree" "create_project" "speedtest" "uptime_monitor" "on_startup") # list all packages here
# TO ADD: todo
INSTALLED_PACKAGES=()

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
        # install_package_action $package_name
        INSTALLED_PACKAGES+=("$package_name")
    else
        echo -n -e "Install ${BOLDBLUE}$package_name?${ENDCOLOR} (Y/n): "
        read response
        # Default Yes - check for response
        if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
            # install_package_action $package_name
            INSTALLED_PACKAGES+=("$package_name")
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
    # Remove other useless files depending on filetype
    
    echo -e "${BOLDBLUE}$package_name${ENDCOLOR}${GREEN} successfully installed${ENDCOLOR}"
    INSTALLED_PACKAGES+=("$package_name")
}

function make_config() { # I Hope this works
    echo -e "${BLUE}Generating configuration...${ENDCOLOR}"
    
    # Username and email
    read -p "Enter your username: " USERNAME
    read -p "Enter your email: " EMAIL
    
    # Bashrc location
    if [[ -f "$HOME/.bashrc" ]]; then
        BASHRC_LOC="$HOME/.bashrc"
    else
        BASHRC_LOC="Not found"
    fi
    
    # Use global INSTALLED_PACKAGES array
    if [[ ${#INSTALLED_PACKAGES[@]} -gt 0 ]]; then
        INSTALLED_PACKAGES_JSON="[\"${INSTALLED_PACKAGES[0]}\""
        for ((i = 1; i < ${#INSTALLED_PACKAGES[@]}; i++)); do
            INSTALLED_PACKAGES_JSON+=", \"${INSTALLED_PACKAGES[i]}\""
        done
        INSTALLED_PACKAGES_JSON+="]"
    else
        INSTALLED_PACKAGES_JSON="[]"
    fi
    
    
    # Version (you could dynamically get this from Git, etc.)
    VERSION="0.1.0"
    
    # Write config to JSON
    cat > "$CONFIG_FILE" <<EOF
{
    "profile": {
        "username": "$USERNAME",
        "email": "$EMAIL"
    },
    "details": {
        "bashrc_location": "$BASHRC_LOC",
        "installed_packages": $INSTALLED_PACKAGES_JSON
    },
    "version": "$VERSION"
}
EOF
    
    # Success message
    if [[ -f "$CONFIG_FILE" ]]; then
        echo -e "${GREEN}Configuration successfully written to${ENDCOLOR} ${BOLDBLUE}${CONFIG_FILE}${ENDCOLOR}"
    else
        echo -e "${ITALICRED}Error: Failed to write configuration.${ENDCOLOR}"
    fi
}

# -----------------------
#  Main
# -----------------------

# Start up
echo -e "${GREEN}Beginning setup ...${ENDCOLOR}"

echo -e "\n##########################################
                 ${ITALICRED}WARNING${ENDCOLOR}
SOME PACKAGES REQUIRE A PYTHON INTERPRETER
##########################################\n"


# add aliases to .bashrc
file="test/bashrc.txt"
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
# read -p  "Would you like to download the docs? (Y/n): " response
# # Default Yes - check for response
# if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
#     cp ./bash-salt_guide.md ~/bash-salt_guide.md
# fi

# Make config file
read -p  "Would you like to create your config file now? (Y/n): " response
# Default Yes - check for response
if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
    make_config
    # echo -e "${ITALICRED}Error: Logic still in development${ENDCOLOR}"
else
    echo -e "Some packages Require $CONFIG_FILE.\nPlease complete at your earliest convenience" # underline this
fi

echo -e "${GREEN}Setup Successful${ENDCOLOR}"