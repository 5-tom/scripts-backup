#!/bin/bash
set -e
cd $HOME

sudo apt install -y apt-transport-https libgdk-pixbuf-xlib-2.0-0 libgdk-pixbuf2.0-0
sudo dpkg -i $(fzf)

#libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libc6 libcairo2 libcups2 libdrm2 libexpat1 libgbm1 libgcc1 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libx11-6 libx11-xcb1 libxcb-dri3-0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxtst6 apt-transport-https libfontconfig1 libdbus-1-3 libstdc++6