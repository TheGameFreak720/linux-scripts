#!/bin/bash

#For Fedora Linux

#Snap
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap

#NordPass
sudo snap install nordpass

#Keybase
sudo dnf install https://prerelease.keybase.io/keybase_amd64.rpm -y
run_keybase
