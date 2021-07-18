#!bin/bash

# For Fedora Linux

# Navigate to root
cd ~

# Update Packages
sudo dnf update -y

# Faster Mirror and Delta RPM
cd /etc/dnf
sudo sed -i'.bak' '$afastestmirror=true' dnf.conf
sudo sed -i'.bak' '$adeltarpm=true' dnf.conf
cd ~

# Multimedia plugins for audio and video
sudo dnf group upgrade --with-optional Multimedia -y

# Gnome Tweaks
sudo dnf install gnome-tweaks
sudo dnf install gnome-extensions-app

# Git
git config --global user.name "Ori Alvarez"
git config --global user.email "someemail@email.com"
git config --global core.editor vim
git config --global init.defaultBranch main

# Default editor
sudo sed -i'.bak' '$aexport EDITOR=vim' ~/.bash_profile

# Reboot to finish installing updates
sudo shutdown -r "The system will reboot to finish installing the updates"
