#!/bin/bash
set -e
cd $HOME

sudo apt install -y mousepad
gsettings set org.xfce.mousepad.preferences.view use-default-monospace-font false
gsettings set org.xfce.mousepad.preferences.view font-name 'Monospace 16'
gsettings set org.xfce.mousepad.preferences.view highlight-current-line true
gsettings set org.xfce.mousepad.preferences.view match-braces true
gsettings set org.xfce.mousepad.preferences.view show-line-endings true
gsettings set org.xfce.mousepad.preferences.view show-line-numbers true
gsettings set org.xfce.mousepad.preferences.view show-whitespace true
gsettings set org.xfce.mousepad.preferences.view word-wrap true
gsettings set org.xfce.mousepad.preferences.window opening-mode 'window'
