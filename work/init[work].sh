#!/bin/bash
set -e

sudo apt update
sudo apt install -y gimp inkscape podman screenkey
#blueman
#in blueman, change audio profile to headset head type

cd $HOME
source Documents/work/scripts/archi.sh
#source Documents/work/scripts/cordova.sh
source Documents/work/scripts/firmware-atheros.sh
#source Documents/work/scripts/mongodb.sh
#sudo apt install -y mono-complete
source Documents/work/scripts/node.sh
source Documents/work/scripts/npm-tools.sh
#source Documents/work/scripts/qemu.sh
#source Documents/work/scripts/teams.sh
source Documents/work/scripts/vscodium.sh

git config --global user.email ""
