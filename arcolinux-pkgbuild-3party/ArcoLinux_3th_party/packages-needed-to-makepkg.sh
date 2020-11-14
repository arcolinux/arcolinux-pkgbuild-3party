#!/bin/bash

#which packages are needed to build with makepkg or choice 2
makepkglist="ccache qt5-charts ninja meson vala gobject-introspection yelp-tools \
 edid-decode perl-module-build perl-www-aur pygtk python2-notify \
 python2-lxml python-distutils-extra yarn\
 cargo python-xdg go dbus-go breeze-icons st"

for i in $makepkglist
do
  sudo pacman -S --needed --noconfirm $i
done

#golang-github-godbus-dbus conflicts with dbus-go - xmonad-log

sudo yay -S python-clickgen

tput setaf 8
echo "#############################################################################################"
echo "###################                   installation done                ######################"
echo "#############################################################################################"
tput sgr0
