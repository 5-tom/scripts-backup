#!/bin/bash
set -e
cd $HOME

sudo apt install -y snapd
sudo snap install codium --classic
/snap/bin/codium --install-extension esbenp.prettier-vscode --force
/snap/bin/codium --install-extension moalamri.inline-fold --force
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
	"workbench.startupEditor": "none"
}
EOF
#.prettierrc:
#{
#	"useTabs": true
#}
