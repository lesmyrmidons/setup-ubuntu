Automated Desktop Setup
=======================

Requirements
-----------

    * curl,
    * git,
    * git-core.

Run
---

If you want to change anything :

```shell
$ curl -L http://git.karbouin.net/kevin.arbouin/desktop-home/blob/master/install.sh | sh
```

And enter your password.

Default installation
--------------------

This project will install the following packages:

    * aptitude
    * bash-completion
    * openssh-server
    * vim
    * git, git-core, git-flow, git-email, git-extras, git-svn
    * zsh
    * curl
    * wget
    * htop
    * ack-grep
    * ccze
    * tmux
    * terminator
    * tig
    * unzip, tar, gzip, bzip2
    * nfs-kernel-server, nfs-common
    * pwgen
    * Java 1.7.x (Oracle)
    * Virtualbox (Oracle)
    * LAMP (MariaDB), pear, phpmyadmin, Composer
    * MongoDB
    * Drivers NVIDIA
    * nodejs
    * Latex, texmaker
    * Pinta (equivalent Paint.NET for Windows)
    * ADST (https://github.com/lesmyrmidons/AdstSF2)
    * HHVM

Custom installation
-------------------

if you want to customize the installation to suit your needs, you have to clone this repository :

    $ git clone git@github.com:lesmyrmidons/ansible-desktop-ubuntu.git

And you have to edit the file `site.yml` and comment line the list roles. For example :

```yml
##
# Ansible playbook for setting up a LAMP development server on Ubuntu 14.04.
#

---
- hosts: local
  user: lesmyrmidons
  sudo: yes

  vars_files:
    - group_vars/all.yml

  roles:
    - common    # List of essential packages
    - vim       # Configuration for vim
    - pinta     # Gimp little
    - latex     # Latex and ide texmaker
    - nvidia    # Drivers owner
    - adst      # Application for series https://github.com/lesmyrmidons/AdstSF2
#    - hhvm
    - web
#    - mongodb
#    - composer
    - nodejs
    - dotfile   # My dotfile (config : git, zsh, bash, tig, ...)
    - gnome-shell
```

Install Ansible :

    $ sudo apt-get install -y -qq python python-pip
    $ sudo pip install ansible

And execute command :

    $ ansible-playbook -i hosts site.yml -c local -K

You can also contribute to add new roles or improve existing.

License
-------

MIT / BSD