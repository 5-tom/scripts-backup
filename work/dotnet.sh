#!/bin/bash
set -e
cd $HOME

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh
rm ./dotnet-install.sh
echo "export DOTNET_CLI_TELEMETRY_OPTOUT=1" >> $HOME/.zshrc
