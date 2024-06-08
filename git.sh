#!/bin/bash
set -e
cd $HOME

sudo apt install -y git meld

mkdir -p "$XDG_CONFIG_HOME/git"
touch "$XDG_CONFIG_HOME/git/config"

git config --global user.name ""
git config --global user.email ""

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> "$XDG_CONFIG_HOME/git/.gitconfig-github"
[user]
	name =
	email =
EOF

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> "$XDG_CONFIG_HOME/git/config"

[includeIf "hasconfig:remote.*.url:git@github.com:*/**"]
	path = .gitconfig-github

[includeIf "hasconfig:remote.*.url:git@ssh.dev.azure.com:*/**"]
	path = .gitconfig-github
EOF
