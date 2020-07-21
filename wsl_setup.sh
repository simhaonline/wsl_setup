#!/bin/sh

## WSL 2 specific things
umask 077
if [ ! -d ~/.ssh ] ; then
  cp -r /mnt/d/.ssh ~/
  chmod 600 ~/.ssh/config
  chmod 400 ~/.ssh/id*
fi

sudo cp ./snippets/wslconfig /mnt/c/Users/r/.wslconfig
sudo cp ./snippets/wsl.conf /etc/wsl.conf
rm /etc/resolv.conf
cp ./snippets/resolv.conf /etc/resolv.conf
## WSL 2 Specific things end here

cat ./snippets/bashrc_partials >> ~/.bashrc
cp ./snippets/vimrc ~/.vimrc
sed -i 's/HOME\/bin/HOME\/.bin/g' ~/.profile
echo "echo \"$USER ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers" | sudo bash

## Debian Specific stuff
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl wget tmux rsync vim openssh-client git man-db sshpass -y
sudo apt autoremove --purge -y
sudo apt clean all
## Debian specific stuff ends here

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rm $HOME/.cargo/env
sed -i 's/export PATH="$HOME\/.cargo\/bin:$PATH"/export PATH="$PATH:$HOME\/.cargo\/bin"/' $HOME/.profile
sudo fstrim /

# Making changes to SSH client config only after it is installed
sudo sed -i 's/HashKnownHosts yes/HashKnownHosts no/' /etc/ssh/ssh_config
exit 0
