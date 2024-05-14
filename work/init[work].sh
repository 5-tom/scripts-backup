#!/bin/bash
set -e

cd $HOME
source Documents/work/scripts/chrome.sh
#source Documents/work/scripts/dotnet.sh
source Documents/work/scripts/npm-tools.sh
#source Documents/work/scripts/sign.sh
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
