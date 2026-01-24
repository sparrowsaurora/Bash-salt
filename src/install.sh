#!/bin/bash

set -e # exit on error

# -----------------------
#  Color Definitions
# -----------------------
RED="\e[31m"
BLUE="\e[36m"
GREEN="\e[32m" # Success messages
BOLDBLUE="\e[1;36m" # File names
ITALICRED="\e[3;31m" # Errors
UNDERLINE="\033[4m" # Vibes
ENDCOLOR="\e[0m" # Return
# Example: echo -e "${ITALICRED}Error: $error_msg${ENDCOLOR}"


# -----------------------
#  Configuration
# -----------------------

STARTING_DIR=$PWD #save current dir for end process
# echo $STARTING_DIR

LATEST_VERSION=bash-salt-0.6.0.tar.gz
DOT_DIR=.bash-salt

# Version
# ?OPTION: dynamically get version from Git, etc.)
VERSION="0.6.0"


# -----------------------
#  Function Definitions
# -----------------------

# Make the config.json file based on user input
# Installs to config_file variable location
function make_config() {
    CONFIG_FILE="config.json" # path to config file
    echo -e "${BLUE}Generating configuration...${ENDCOLOR}"
    
    # Username and email
    read -p "Enter your username: " USERNAME
    read -p "Enter your email: " EMAIL
    
    # Write config to JSON
    cat > "$CONFIG_FILE" <<EOF
{
    "profile": {
        "username": "$USERNAME",
        "email": "$EMAIL"
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

echo -e "${GREEN}Beginning setup ...${ENDCOLOR}"

# switch directory to install
# cd $HOME
cd test # !IMPORTANT: remove before prod
mkdir $DOT_DIR
cd $DOT_DIR

# Download files + unzip
echo "Downloading ..."
curl -O "https://bash-salt.vercel.app/assets/versions/$LATEST_VERSION"
tar -xzf $LATEST_VERSION
# NOTE: tar and curl are default installs for gitbash
# NOTE: this is why we are avoiding using wget and unzip 
# NOTE: this is also for future access to unix type systems
# -x: Extract files from the archive.
# -v: Verbose output (optional).
# -z: Decompress the archive using gzip.
# -f: Specifies the filename of the archive 
rm -rf $LATEST_VERSION
echo "Downloaded files"

# Link commands to .bashrc
echo "linking to .bashrc" # ?OPTION: option to rename .bashrc file (-b?)
# cat <<EOF >> "$HOME/.bashrc"
cat <<EOF >> ".echo_test" # !IMPORTANT: remove before prod
[ -f "$HOME/$DOT_DIR/$VERSION/.aliases" ] && source "$HOME/$DOT_DIR/$VERSION/.aliases"
[ -f "$HOME/$DOT_DIR/$VERSION/.bashrc" ] && source "$HOME/$DOT_DIR/$VERSION/.bashrc"
EOF

# config file setup
read -p  "Would you like to create your config file now? (Y/n): " response
# Default Yes - check for response
if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
    make_config
else
    echo -e "${UNDERLINE}Some packages Require config.json${ENDCOLOR}"
    echo -e "${UNDERLINE}Please complete it at your earliest convenience${ENDCOLOR}"
fi

# add bash commands for packages
cd $VERSION

dot_sh=(*.sh)

# If the glob didn't match anything
if [[ ${dot_sh[0]} == "*.sh" ]]; then
    dot_sh=()
fi

for file_path in "${dot_sh[@]}"; do
    echo "Adding $file_path shell config command"
    # source files on terminal session
    # 1. copy contents to .bash-salt/$version/.bashrc

    echo >> .bashrc
    echo >> .bashrc
    cat "$file_path" >> .bashrc

    # 2. delete?
    # rm -rf $filepath #????
done

cd ..

#exit
cd $STARTING_DIR
echo -e "${GREEN}Setup Successful${ENDCOLOR}"

 exit 1
fi