#!/bin/bash
set -e
#trap debug
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
count=0
for name in $(ls -d */ | cut -f1 -d'/'); do
  cd $name
  pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
  pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
  epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
  oldpkgver=$(grep -m1 "pkgver" .previous-version | cut -d= -f2)
  oldpkgrel=$(grep -m1 "pkgrel" .previous-version | cut -d= -f2)
  oldepoch=$(grep -m1 "epoch" .previous-version | cut -d= -f2)
  echo "######################"
  echo "Previous version"
  echo "######################"
  echo "oldpkgver = "$oldpkgver
  echo "oldpkgrel = "$oldpkgrel
  echo "oldepoch = "$oldepoch
  echo "######################"
  echo "New version"
  echo "######################"
  echo "pkgver = "$pkgver
  echo "pkgver="$pkgver > .current-version
  echo "pkgrel = "$pkgrel
  echo "pkgrel="$pkgrel >> .current-version
  echo "epoch = "$epoch
  echo "epoch="$epoch >> .current-version
  if [[ $pkgver != $oldpkgver  ||  $pkgrel != $oldpkgrel  || $epoch != $oldepoch ]] ; then
    tput setaf 1;
    echo "#############################################################################################"
    echo "We need to build "$name
    echo "#############################################################################################"
    tput sgr0
    sh ./build*
    cp .current-version .previous-version
    echo "Current version is now same as previous version"
  else
    tput setaf 2;echo "No need to build "$name;tput sgr0
  fi
  echo "#############################################################################################"
  echo "################   "$name" updated"
  echo "#############################################################################################"
  cd ..
done
