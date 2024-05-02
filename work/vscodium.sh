#!/bin/bash
set -e
cd $HOME

sudo apt install -y snapd
sudo snap install codium --classic
/snap/bin/codium --install-extension Continue.continue --force
/snap/bin/codium --install-extension esbenp.prettier-vscode --force
/snap/bin/codium --install-extension pkief.material-icon-theme --force

# /snap/bin/codium --install-extension DigitalBrainstem.javascript-ejs-support --force
# /snap/bin/codium --install-extension humao.rest-client --force
# /snap/bin/codium --install-extension mesonbuild.mesonbuild --force
# /snap/bin/codium --install-extension ms-dotnettools.csdevkit --force
# /snap/bin/codium --install-extension ms-dotnettools.vscode-dotnet-runtime --force
# /snap/bin/codium --install-extension prisma.prisma --force
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
	"continue.telemetryEnabled": false
}
EOF
#.prettierrc:
#{
#	"useTabs": true
#}
