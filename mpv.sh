#!/bin/bash
set -e
cd $HOME

sudo apt install -y mpv
mkdir -p .config/mpv
echo "keep-open=yes" >> .config/mpv/mpv.conf
sudo sed -i 's/Exec=mpv --player-operation-mode=pseudo-gui -- %U/Exec=mpv --no-keepaspect-window --player-operation-mode=pseudo-gui -- %U/' /usr/share/applications/mpv.desktop
