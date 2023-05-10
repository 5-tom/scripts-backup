#!/bin/bash
set -e
cd $HOME

sudo mkdir -p /etc/apt/sources.list.d
echo "deb http://deb.debian.org/debian bullseye main" | sudo tee -a /etc/apt/sources.list.d/bullseye.list
sudo apt update
sudo apt install -y libssl1.1
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo gio trash /etc/apt/sources.list.d/bullseye.list /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
