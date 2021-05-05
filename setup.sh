#!/usr/bin/env bash

usage_exit() {
    echo "Usage: $( basename $0) [-h] [-f]" 1>&2
    echo
    echo "Options:"
    echo "  -h  show this help"
    echo "  -i  run automaticaly ansible playbook 'ansible-playbook -i inventory localhost.yml -K'"
    exit 1
}

install=false
while getopts :hi OPT
do
    case $OPT in
        h)  usage_exit
            ;;
        i)  install=true
            ;;
        \?) usage_exit
            ;;
    esac
done

which -a ansible
if [[ $? != 0 ]] ; then
    echo "Install ansible"
    sudo apt update
    sudo apt-add-repository --yes --update 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu eoan main'
    sudo apt install -y ansible
fi

if $install; then
    ansible-galaxy collection install -r requirements.yml
    ansible-galaxy role install -r requirements.yml
    ansible-playbook -i inventory localhost.yml -K
fi

