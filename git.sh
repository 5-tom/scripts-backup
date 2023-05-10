#!/bin/bash
set -e
cd $HOME

sudo apt install -y git meld
git config --global user.name ""
git config --global user.email ""
