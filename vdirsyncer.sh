#!/bin/bash
set -e
cd $HOME

ln -s $HOME/Documents/dotvdirsyncer $HOME/.config/vdirsyncer
sudo apt install -y pipx
pipx install vdirsyncer
pipx ensurepath
echo "export PATH=\$HOME/.local/pipx/venvs/vdirsyncer/bin:\$PATH" >> .zshrc
