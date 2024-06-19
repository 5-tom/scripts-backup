#!/bin/bash
set -e
cd $HOME

sudo apt install -y snapd
sudo snap install codium --classic
/snap/bin/codium --install-extension Continue.continue --force
/snap/bin/codium --install-extension esbenp.prettier-vscode --force
/snap/bin/codium --install-extension pkief.material-icon-theme --force
/snap/bin/codium --install-extension bradlc.vscode-tailwindcss --force
/snap/bin/codium --install-extension wix.vscode-import-cost --force
/snap/bin/codium --install-extension antfu.unocss --force

# /snap/bin/codium --install-extension DigitalBrainstem.javascript-ejs-support --force
# /snap/bin/codium --install-extension mesonbuild.mesonbuild --force
# /snap/bin/codium --install-extension qwtel.sqlite-viewer --force

sudo ln -sn /var/lib/snapd/desktop/applications/codium* /usr/share/applications/

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> $HOME/.config/VSCodium/User/settings.json
{
	"editor.detectIndentation": false,
	"editor.insertSpaces": false,
	"editor.wordWrap": "on",
	"files.hotExit": "off",
	"workbench.panel.defaultLocation": "right",
	"window.restoreWindows": "none",
	"workbench.startupEditor": "none",
	"editor.formatOnSave": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"terminal.integrated.defaultLocation": "editor",
	"prettier.useTabs": true,
	"continue.telemetryEnabled": false,
	"continue.enableTabAutocomplete": false,
	"editor.fontFamily": "'JetBrains Mono Medium', 'Droid Sans Mono', 'monospace', monospace",
	"javascript.suggest.autoImports": false,
	"typescript.suggest.autoImports": false
}
EOF
#.prettierrc:
#{
#	"useTabs": true
#}

mkdir -p $HOME/.continue
cp $HOME/Documents/envs/config.json $HOME/.continue/config.json
