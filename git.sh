#!/bin/bash
set -e
cd $HOME

sudo apt install -y git meld
git config --global user.name ""
git config --global user.email ""

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .gitconfig

[includeIf "hasconfig:remote.*.url:git@github.com:*/**"]
[user]
	name = 
	email = 
EOF
