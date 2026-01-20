#!/bin/bash

CURRENT_DIR=$PWD #save currentdir for end process
# echo $CURRENT_DIR

# switch directory to install
# cd ~
cd ./test # !IMPORTANT: remove before prod
mkdir .bash-salt
cd .bash-salt

# Download files + unzip
echo "Downloading ..."
curl -O "https://bash-salt.vercel.app/assets/versions/bash-salt-0.5.0.tar.gz"
tar -xzf bash-salt-0.5.0.tar.gz
# NOTE: tar and curl are default installs for gitbash
# NOTE: this is why we are avoiding using wget and unzip 
# NOTE: this is also for future access to unix type systems
# -x: Extract files from the archive.
# -v: Verbose output (optional).
# -z: Decompress the archive using gzip.
# -f: Specifies the filename of the archive 
rm -rf bash-salt-0.5.0.tar.gz
echo "Downloaded files"


#exit
cd $CURRENT_DIR

 exit 1
fi