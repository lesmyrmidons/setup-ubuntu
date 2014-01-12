#!/usr/bin/env bash

CURRENT=`pwd`

if [ ! -d ~/.config-desktop-home] then
    echo "\033[0;32m Installation de python.......\033[0m"
    apt-get install -y -qq python git git-core

    echo "\033[0;32m Installation d'ansible.......\033[0m"
    pip install ansible

    echo "\033[0;32m Clone de la config d'installation.\033[0m"
    sudo -u `whoami` -H git clone git@git.karbouin.net:kevin.arbouin/desktop-home.git $HOME/.config-desktop-home
else
    echo "\033[0;32mThe folder ".config-desktop-home" is already installed\033[0m"
fi

cd $HOME/.config-desktop-home

ansible-playbook -i hosts site.yml