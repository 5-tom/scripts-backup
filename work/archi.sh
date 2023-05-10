#!/bin/bash
set -e
cd $HOME

wget "https://www.archimatetool.com/downloads/archi.php?/4.10.0/Archi-Linux64-4.10.0.tgz"
tar -xvf *Archi-Linux64-4.10.0.tgz
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > ./Archi/Archi.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Archi
Comment=Archi
Exec=Archi
Icon=application.png
Terminal=false
EOF
sudo mv Archi /usr/local/
sudo ln -s /usr/local/Archi/Archi /usr/local/bin/
sudo ln -s /usr/local/Archi/Archi.desktop /usr/share/applications/
gio trash *Archi*
