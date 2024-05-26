#!/bin/bash
set -e
cd $HOME

wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip -d JetBrainsMono-2304
cp -n JetBrainsMono-2304/fonts/ttf/* "$XDG_DATA_HOME"/fonts
#sudo cp JetBrainsMono-2304/fonts/ttf/* /usr/local/share/fonts/
gio trash JetBrainsMono-2304
sed -i 's/FontName=Monospace 18/FontName=JetBrains Mono Medium 18/' "$XDG_CONFIG_HOME"/xfce4/terminal/terminalrc
