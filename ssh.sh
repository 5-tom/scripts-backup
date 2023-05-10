#!/bin/bash
set -e
cd $HOME

ln -s $HOME/Documents/dotssh $HOME/.ssh
chmod 600 $HOME/.ssh/*
