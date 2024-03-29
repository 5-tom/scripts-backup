#!/bin/bash
set -e
cd $HOME

sudo apt install -y snapd
sudo snap install codium --classic
/snap/bin/codium --install-extension esbenp.prettier-vscode --force
/snap/bin/codium --install-extension moalamri.inline-fold --force
/snap/bin/codium --install-extension humao.rest-client --force
/snap/bin/codium --install-extension qwtel.sqlite-viewer --force
/snap/bin/codium --install-extension pkief.material-icon-theme --force
/snap/bin/codium --install-extension prisma.prisma --force
sudo ln -sn /var/lib/snapd/desktop/applications/codium* /usr/share/applications/
echo "/snap/bin/codium --install-extension ow.vscode-subword-navigation-1.2.0.vsix --force"

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
	"terminal.integrated.defaultLocation": "editor"
}
EOF
#.prettierrc:
#{
#	"useTabs": true
#}
