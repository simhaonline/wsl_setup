#!/bin/sh

## WSL 2 specific things
## Hard coded username r for the pre-existng Windows user and To-Be-Created Unix one
umask 077
if [ ! -d ~/.ssh ] ; then
  cp -r /mnt/c/Users/r/.ssh ~/
  chmod 600 ~/.ssh/config
  chmod 400 ~/.ssh/id*
fi

sudo cp ./snippets/wslconfig /mnt/c/Users/r/.wslconfig
sudo cp ./snippets/wsl.conf /etc/wsl.conf

## WSL 2 Specific things end here

# Setup SSH agent, umask, aliases and prompt
cat ./snippets/bashrc_partials >> ~/.bashrc

# Import settings for git and vim, and other config, if present
cp ./snippets/vimrc ~/.vimrc

# Change local executables folder from ~/bin to ~/.bin
sed -i 's/HOME\/bin/HOME\/.bin/g' ~/.profile

# Passwordless sudo
echo "echo \"$USER ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers" | sudo bash

## Debian Specific stuff
# Install ansible packages, for Debian like environments
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl wget tmux rsync vim openssh-client git man-db sshpass -y
# Repo clean up
sudo apt autoremove --purge -y
sudo apt clean all
## Debian specific stuff ends here

# Making changes to SSH client config, after it is installed
sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo sed -i 's/HashKnownHosts yes/HashKnownHosts no/' /etc/ssh/ssh_config

exit 0
