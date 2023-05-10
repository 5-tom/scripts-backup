#!/bin/bash
set -e
cd $HOME

sudo apt install -y taskwarrior
ln -s $HOME/Documents/dottask $HOME/.task
echo "data.location=/home/tom/.task" >> $HOME/.taskrc
echo "dateformat=D-M-y" >> $HOME/.taskrc
