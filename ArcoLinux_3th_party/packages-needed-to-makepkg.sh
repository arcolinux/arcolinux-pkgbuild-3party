#!/bin/bash

#which packages are needed to build with makepkg or choice 2
makepkglist="ccache qt5-charts ninja meson vala gobject-introspection yelp-tools \
 edid-decode perl-module-build perl-www-aur pygtk python2-notify \
 python2-lxml python-distutils-extra yarn typescript \
 cargo python-xdg go dbus-go breeze-icons legendary libretro-picodrive ponymix \
 python-bottle python-pyftpdlib python-pygame python-bcrypt steam-tweaks retroarch libretro-genesis-plus-gx libretro-mgba \
 libretro-nestopia libretro-snes9x libretro-mupen64plus-next libretro-beetle-pce-fast libretro-flycast libretro-beetle-psx-hw \
 libretro-play libretro-yabause python-vdf pycrc python-clickgen python-inotify-simple libretro-dolphin retroarch-autoconfig-udev-git \
 python-hsaudiotag3k python-isounidecode python-pulse-control python-pylyrics  python-pysdl2 python-stagger snapd-glib asciidoc wyvern rplay mongo-c-driver \
 python-pylast python-send2trash python-musicbrainzngs noto-fonts-extra noto-fonts-cjk"

for i in $makepkglist
do
  sudo pacman -S --needed --noconfirm $i
done

#golang-github-godbus-dbus conflicts with dbus-go - xmonad-log



tput setaf 8
echo "#############################################################################################"
echo "###################                   installation done                ######################"
echo "#############################################################################################"
tput sgr0
