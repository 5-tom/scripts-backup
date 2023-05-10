#!/bin/bash
set -e
cd $HOME

sudo apt install -y libimage-exiftool-perl
echo "alias xif='exiftool -all= \"\$(fzf)\"'" >> .zshrc
echo "alias xifa='exiftool -all= *'" >> .zshrc
