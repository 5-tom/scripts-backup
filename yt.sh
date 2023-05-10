#!/bin/bash
set -e
cd $HOME

sudo apt install -y curl ffmpeg fzf git jq make mpv socat
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
git clone https://github.com/pystardust/ytfzf
cd ytfzf
sudo make install doc
mkdir -p $HOME/.config/ytfzf
mv addons/scrapers $HOME/.config/ytfzf
cd ..
gio trash ytfzf
echo "new search" >> $HOME/Videos/history
sudo sed -i 's/inf --idle/inf --geometry=0%:0% --idle/' /usr/local/bin/ytfzf
