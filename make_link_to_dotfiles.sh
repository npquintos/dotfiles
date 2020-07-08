#!/bin/bash

# use this when you are done with the installation
# i.e. you already run install_my_fave_apps_and_dots.sh
# and you have added a new user and would like that user
# to inherit these dot files. This is made available for
# anyone to use, placed in /usr/local/bin

myhome="/home/$(whoami)"
mysource="/etc/skel/dotfiles"
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    ln -s $i ${myhome}/${j/__/\.}
done
ln -s ${mysource}/init.vim ${myhome}/.config/nvim/.
