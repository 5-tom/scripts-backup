#!/bin/bash
set -e
cd $HOME

mkdir -p /home/tom/.local/share/khal/calendars/private/todoman
ln -s $HOME/Documents/dottodoman $HOME/.config/todoman
sudo apt install -y pipx
pipx install todoman
pipx ensurepath
echo "export PATH=\$HOME/.local/pipx/venvs/todoman/bin:\$PATH" >> .zshrc
echo "alias task='todo'" >> .zshrc
