#!/bin/bash
set -e

#su
#sudo adduser tom sudo
sudo apt update
sudo apt install -y bat fonts-noto-color-emoji libfuse2 libglib2.0-bin gparted qbittorrent xclip zsh
sudo chsh -s /bin/zsh tom
sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

cd $HOME
source Documents/scripts/adb.sh
source Documents/scripts/exiftool.sh
source Documents/scripts/git.sh
source Documents/scripts/khal.sh
source Documents/scripts/khard.sh
source Documents/scripts/mousepad.sh
source Documents/scripts/mpv.sh
source Documents/scripts/ssh.sh
source Documents/scripts/todoman.sh
source Documents/scripts/vdirsyncer.sh
source Documents/scripts/xfce4.sh
source Documents/scripts/yt.sh
source Documents/scripts/zim.sh

#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
#https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/
#https://addons.mozilla.org/en-GB/firefox/addon/popup-blocker/

#https://randomhackernews.com/
#https://www.pinterest.co.uk/

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .zshrc
alias code='/snap/bin/codium'
alias number='khard | grep Myself'
alias myself='number'
alias cat='batcat --paging=never'
alias pipe='echo -n "|" | xclip -selection c'
alias ls='ls --color=auto -a'
alias rm='gio trash'
alias num='stat -c %a'
#-f pulse -i x
alias record="ffmpeg -video_size $(xdpyinfo | awk '/dimensions/ {print $2}') -framerate 30 -f x11grab -i :0.0 $(openssl rand -hex 20).mp4"
alias his='echo -n "$(cat $HOME/.zsh_history | fzf --tac)" | xclip -selection c'

#https://wiki.archlinux.org/title/Zsh#Prompt_themes
autoload -Uz promptinit
promptinit
prompt adam1

#https://zsh.sourceforge.io/Doc/Release/Options.html
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH=/home/tom/Documents/scripts/usr-local-bin:$PATH
EOF
