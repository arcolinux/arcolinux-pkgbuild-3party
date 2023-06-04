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
for name in $(ls -d r*/ | cut -f1 -d'/'); do
  cd $name
  pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
  pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
  epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
  echo "pkgver = "$pkgver
  echo "pkgver="$pkgver > .current-version
  echo "pkgrel = "$pkgrel
  echo "pkgrel="$pkgrel >> .current-version
  echo "epoch = "$epoch
  echo "epoch="$epoch >> .current-version
  cp .current-version .previous-version
  echo "#############################################################################################"
  echo "################   "$name" updated"
  echo "#############################################################################################"
  cd ..
done
tput setaf 2;
echo "#############################################################################################"
echo "Versions created "
echo "#############################################################################################"
tput sgr0
