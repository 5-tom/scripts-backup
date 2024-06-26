#!/bin/bash
set -e
cd $HOME

wget "https://www.archimatetool.com/downloads/archi/5.3.0/Archi-Linux64-5.3.0.tgz"
tar -xvf *Archi-Linux64-5.3.0.tgz
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
mkdir -p $HOME/.archi/scripts
sed -i 's/^-Ddata.location.*/-Ddata.location=@user.home\/.archi/' /usr/local/Archi/Archi.ini

cp $HOME/Documents/scripts/jArchi_1.6.1.archiplugin .
unzip jArchi_1.6.1.archiplugin -d $HOME/.archi/dropins/ && \
rm $HOME/.archi/dropins/archi-plugin
