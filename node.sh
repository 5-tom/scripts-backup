#!/bin/bash
set -e
cd $HOME

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install node
