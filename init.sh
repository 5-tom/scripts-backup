#!/bin/bash
set -e

#su
#sudo adduser tom sudo
sudo apt update
sudo apt install -y bat fonts-noto-color-emoji gimp gparted inkscape libfuse2 libglib2.0-bin podman podman-compose qbittorrent xclip zsh
sudo chsh -s /bin/zsh tom
sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

cd $HOME
source Documents/scripts/profile.sh
source .profile

source Documents/scripts/adb.sh
source Documents/scripts/archi.sh
source Documents/scripts/exiftool.sh
source Documents/scripts/git.sh
source Documents/scripts/khal.sh
source Documents/scripts/khard.sh
source Documents/scripts/mousepad.sh
source Documents/scripts/mpv.sh
source Documents/scripts/node.sh
source Documents/scripts/ssh.sh
source Documents/scripts/todoman.sh
source Documents/scripts/vdirsyncer.sh
source Documents/scripts/vscodium.sh
source Documents/scripts/xfce4.sh
source Documents/scripts/jetbrains.sh
source Documents/scripts/yt.sh

#https://addons.mozilla.org/en-GB/firefox/addon/ublock-origin/
#https://addons.mozilla.org/en-GB/firefox/addon/istilldontcareaboutcookies/
#https://addons.mozilla.org/en-GB/firefox/addon/popup-blocker/
#https://addons.mozilla.org/en-GB/firefox/addon/libredirect/

#https://mataroa.blog/dashboard/
#https://letterboxd.com/tom_5/list/seen/
#linkedin links
#https://news.ycombinator.com/

echo "Defaults !admin_flag" | sudo tee /etc/sudoers.d/disable_admin_file_in_home

mkdir -p $XDG_CACHE_HOME/X11
#doesn't work:
sudo sed -i 's/$HOME\/\./$XDG_CACHE_HOME\/X11\//' /etc/X11/Xsession

mkdir -p $XDG_CACHE_HOME/zsh

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

#https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

#https://zsh.sourceforge.io/Doc/Release/Options.html
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH=/home/tom/Documents/scripts/usr-local-bin:$PATH
EOF

gio trash $HOME/.sudo_as_admin_successful
gio trash $HOME/.face
gio trash $HOME/.face.icon
gio trash $HOME/.wget-hsts
