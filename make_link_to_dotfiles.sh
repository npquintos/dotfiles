#!/bin/bash
myhome="/home/$(whoami)"
mysource="/etc/skel/dotfiles"
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    ln -s $i ${myhome}/${j/__/\.}
done
