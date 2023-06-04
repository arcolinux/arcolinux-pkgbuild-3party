#!/bin/bash
#CHROOT=$HOME/Documents/chroot-archlinux
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot
#https://archlinux.org/news/git-migration-completed/
#https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager
#tput setaf 0 = black 
#tput setaf 1 = red 
#tput setaf 2 = green
#tput setaf 3 = yellow 
#tput setaf 4 = dark blue 
#tput setaf 5 = purple
#tput setaf 6 = cyan 
#tput setaf 7 = gray 
#tput setaf 8 = light gray

#long path
wpdpath=$(dirname $(readlink -f $(basename `pwd`)))

#check version

pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
oldpkgver=$(grep -m1 "pkgver" .previous-version | cut -d= -f2)
oldpkgrel=$(grep -m1 "pkgrel" .previous-version | cut -d= -f2)
oldepoch=$(grep -m1 "epoch" .previous-version | cut -d= -f2)

if [[ $pkgver != $oldpkgver  ||  $pkgrel != $oldpkgrel  || $epoch != $oldepoch ]] ; then
  tput setaf 3;
  echo "#############################################################################################"
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
  echo "We need to build "$name
  tput sgr0

  destination1=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/"
  destination2=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/"
  destination3=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_iso/x86_64/"
  destination4=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_testing/x86_64/"
  destination5=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/x86_64/"
  destination6=$HOME"/ARCO/TEST"
  destination7=$HOME"/ARCO/ARCOLINUX-ARCHIVE/packages"

  destiny=$destination5

  # 2. makepkg"
  # 1. chroot"

  CHOICE=1
  pwdpath=$(echo $PWD)
  pwd=$(basename "$PWD")

  #which packages are always going to build with makepkg or choice 2
  makepkglist="nordzy-icon-theme-git"

  for i in $makepkglist
  do
    if [[ "$pwd" == "$i" ]] ; then
    CHOICE=2
    fi
  done
  search=""
  search1=$(basename "$PWD")
  search2=arcolinux

  search=$search1
  rm -rf /tmp/tempbuild
  if test -f "/tmp/tempbuild"; then
    rm /tmp/tempbuild
  fi
  mkdir /tmp/tempbuild
  cp -r $pwdpath/* /tmp/tempbuild/
  #cp -r $pwdpath/.* /tmp/tempbuild

  cd /tmp/tempbuild/

  if [[ $CHOICE == "1" ]] ; then

    tput setaf 2
    echo "#############################################################################################"
    echo "#########        Let us build the package in CHROOT ~/Documents/chroot-archlinux"
    echo "#############################################################################################"
    tput sgr0
    CHROOT=$HOME/Documents/chroot-archlinux
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT

    echo "Signing the package"
    echo "#############################################################################################"

    if [ $search = "wps-office" ]
    then
      gpg --detach-sign $search-mime*pkg.tar.zst
      gpg --detach-sign $search-1*pkg.tar.zst
    else
      gpg --detach-sign $search*pkg.tar.zst
    fi

  else

    tput setaf 3
    echo "#############################################################################################"
    echo "#########        Let us build the package with MAKEPKG "$(basename `pwd`)
    echo "#############################################################################################"
    tput sgr0
    makepkg --sign
  fi

  echo "Moving created files to " $destiny
  echo "#############################################################################################"

  if [ $search = "wps-office" ]
  then
    cp -n $search-mime*pkg.tar.zst $destiny
    cp -n $search-mime*pkg.tar.zst.sig $destiny
    cp -n $search-1*pkg.tar.zst $destiny
    cp -n $search-1*pkg.tar.zst.sig $destiny
  else
    cp -n $search*pkg.tar.zst $destiny
    cp -n $search*pkg.tar.zst.sig $destiny
  fi

  firstLetter="$(echo $search | head -c 1)"

  echo "Moving created files to " $destination7/$firstLetter/$search1
  echo "#############################################################################################"

  [ -d $destination7/$firstLetter ] && echo "Directory " $firstLetter " exists" || mkdir $destination7/$firstLetter
  [ -d "$destination7/$firstLetter/$search1" ] && echo "Directory " $search1 " exists" || mkdir "$destination7/$firstLetter/$search1"

  mv $search*pkg.tar.zst "$destination7/$firstLetter/$search1"
  mv $search*pkg.tar.zst.sig "$destination7/$firstLetter/$search1"

  echo "#############################################################################################"
  echo "Cleaning up"
  echo "#############################################################################################"
  echo "deleting unnecessary folders"
  echo "#############################################################################################"

  if [[ -f $wpdpath/*.log ]]; then
    rm $pwdpath/*.log
  fi
  if [[ -f $wpdpath/*.deb ]]; then
    rm $pwdpath/*.deb
  fi
  if [[ -f $wpdpath/*.tar.gz ]]; then
    rm $pwdpath/*.tar.gz
  fi

  tput setaf 10
  echo "#############################################################################################"
  echo "###################                       build done                   ######################"
  echo "#############################################################################################"
  tput sgr0
  cp $wpdpath/.current-version $wpdpath/.previous-version
else
  echo "#############################################################################################"
  tput setaf 2;echo "No need to build "$name;tput sgr0
  echo "#############################################################################################"
  sleep 3
fi
