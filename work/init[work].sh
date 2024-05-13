#!/bin/bash
set -e

sudo apt update
#docker.io docker-compose
sudo apt install -y gimp inkscape podman podman-compose

cd $HOME
source Documents/work/scripts/archi.sh
source Documents/work/scripts/chrome.sh
source Documents/work/scripts/compass.sh
#source Documents/work/scripts/dotnet.sh
source Documents/work/scripts/node.sh
source Documents/work/scripts/npm-tools.sh
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
