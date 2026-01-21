#!/bin/bash

set -e # exit on error

STARTING_DIR=$PWD #save current dir for end process
LATEST_VERSION=bash-salt-0.6.0.tar.gz
# echo $STARTING_DIR

# switch directory to install
# cd $HOME
cd ./test # !IMPORTANT: remove before prod
mkdir .bash-salt
cd .bash-salt

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
# TODO: add .aliases & .bashrc to zip
echo "linking to .bashrc" # ?OPTION: option to rename .bashrc file (-b?)
# cat <<EOF >> "$HOME/.bashrc"
cat <<EOF >> "test/.echo_test" # !IMPORTANT: remove before prod
[ -f "$HOME/.bash-salt/.aliases" ] && source "$HOME/.bash-salt/.aliases"
[ -f "$HOME/.bash-salt/.bashrc" ] && source "$HOME/.bash-salt/.bashrc"
EOF



#exit
cd $STARTING_DIR
echo "Successfully installed"

 exit 1
fi