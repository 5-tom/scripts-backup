#!/bin/bash
set -e

sudo apt update
sudo apt install -y gimp inkscape podman podman-compose screenkey
#blueman
#in blueman, change audio profile to headset head type

cd $HOME
source Documents/work/scripts/archi.sh
source Documents/work/scripts/chrome.sh
#source Documents/work/scripts/cordova.sh
source Documents/work/scripts/firmware-atheros.sh
#sudo apt install -y mono-complete
source Documents/work/scripts/node.sh
source Documents/work/scripts/npm-tools.sh
#source Documents/work/scripts/qemu.sh
source Documents/work/scripts/vscodium.sh

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .gitconfig-bitbucket
[user]
	name =
	email =
EOF

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .gitconfig

[includeIf "hasconfig:remote.*.url:git@bitbucket.org:*/**"]
	path = .gitconfig-bitbucket
EOF
