#!/bin/bash
set -e
cd $HOME

sudo apt install -y openjdk-17-jdk-headless
npm i -g firebase-tools
npx -y playwright install
