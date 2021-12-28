#!/bin/sh -e

echo "\n Updating \n"

# Search Updates
sudo pacman -Syu --noconfirm

echo "\n Installing essetial packages \n"

# Install essential packages
sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S git flatpak docker docker-compose nodejs-lts-fermium npm python-pip bpytop zsh ttf-fira-code neofetch --noconfirm

echo "\n Configuring Docker \n"

# Init Docker services
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

echo "\n Configuring Git \n"

# Configure Git
git config --global user.name "Mário Victor Ribeiro Silva"
git config --global user.email "mariovictorrs@gmail.com"

# Detect DE and install specific packages
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]
then

echo "\n Installing Packages for KDE \n"

sudo pacman -S ark kate kcalc spectacle gwenview --noconfirm

fi

echo "\n Installing Paru \n"

# Install Paru
cd $HOME
git clone https://aur.archlinux.org/paru.git

cd paru
makepkg -si --noconfirm
