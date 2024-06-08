#!/bin/bash
set -e
cd "$HOME"

mkdir -p "$XDG_CONFIG_HOME/npm"
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > "$XDG_CONFIG_HOME/npm/npmrc"
cache=${XDG_CACHE_HOME}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js
logs-dir=${XDG_STATE_HOME}/npm/logs
EOF

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source "$HOME/.config/nvm/nvm.sh"
nvm install node

sed -i 's/export NVM_DIR="$HOME\/.nvm"/export NVM_DIR="$XDG_DATA_HOME\/nvm"/' .zshrc

echo 'export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc' >> "$HOME/.profile"
echo 'export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc' >> "$HOME/.zshrc"

echo 'export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history' >> "$HOME/.profile"
echo 'export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history' >> "$HOME/.zshrc"
