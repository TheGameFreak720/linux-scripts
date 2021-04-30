#!/bin/bash

# For Ubuntu Linux

# Keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
run_keybase

# Snapd
sudo apt update
sudo apt install snapd

# Nordpass
sudo snap install nordpass
