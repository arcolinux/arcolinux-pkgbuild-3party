#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue

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
  echo "We need to build "$name
  echo "######################"
  tput sgr0

  destination1=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/"
  destination2=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/"
  destination3=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_iso/x86_64/"
  destination4=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_testing/x86_64/"
  destination5=$HOME"/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/x86_64/"
  destination6=$HOME"/ARCO/TEST"
  destination7=$HOME"/ARCO/ARCOLINUX-ARCHIVE/packages"

  destiny=$destination2

  # 2. makepkg"
  # 1. chroot"

  CHOICE=1
  pwdpath=$(echo $PWD)
  pwd=$(basename "$PWD")

  #which packages are always going to build with makepkg or choice 2
  makepkglist="rofi-lbonn-wayland-only-git wlr-randr wlr-randr-git hyprpaper-git hyprpicker-git pikaur-git deezer snap-pac-grub gnome-terminal-transparency cava scangearmp2-mg7700 libfprint-1 libayatana-indicator ayatana-ido libayatana-appindicator sweet-cursor-theme-git curseradio-git gnome-shell-extension-pop-shell-git steam-buddy screenkey-git conky-lua-archers sayonara-player systemd-manager font-manager-git /
  sutils-git perl-checkupdates-aur fvwm3-git yin-yang-git oh-my-zsh-powerline-theme-git gwe pygtk python2-notify mangohud"

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

  #take special care to special packages
  if [[ $search == "pkgbuild-chaotic-mirrorlist" ]]; then
    search="chaotic-mirrorlist"
  fi
  if [[ $search == "pkgbuild-chaotic-keyring" ]]; then
    search="chaotic-keyring"
  fi

  if [[ $CHOICE == "1" ]] ; then

    tput setaf 2
    echo "#############################################################################################"
    echo "#########        Let us build the package in CHROOT "$(basename `pwd`)
    echo "#############################################################################################"
    tput sgr0
    CHROOT=$HOME/Documents/chroot-arcolinux-3p
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT

    echo "Signing the package"
    echo "#############################################################################################"
    gpg --detach-sign *$search*pkg.tar.zst

    if [[ $search == "qtscrcpy" ]]; then
      mv qtscrcpy-docs*pkg.tar.zst $destiny
      mv qtscrcpy-docs*pkg.tar.zst.sig $destiny    
    fi

    if [[ $search == "sdbus-cpp" ]]; then
      gpg --detach-sign *$search-1*pkg.tar.zst
      gpg --detach-sign *$search-doc*pkg.tar.zst  
    fi 
    
    if [[ $search == "wlroots-git" ]]; then
      gpg --detach-sign wlroots-git-0*pkg.tar.zst
      gpg --detach-sign wlroots-git-debug*pkg.tar.zst
    fi

    if [[ $search == "sway-git" ]]; then
      gpg --detach-sign sway-git-r*pkg.tar.zst
      gpg --detach-sign sway-git-debug-r*pkg.tar.zst
    fi

  else

    tput setaf 3
    echo "#############################################################################################"
    echo "#########        Let us build the package with MAKEPKG "$(basename `pwd`)
    echo "#############################################################################################"
    tput sgr0
    makepkg -s --sign
  fi

  if [[ $search == "qtscrcpy" ]]; then
    gpg --detach-sign qtscrcp*pkg.tar.zst
    cp qtscrcp*pkg.tar.zst $destiny
    cp qtscrcp*pkg.tar.zst.sig $destiny
  fi

  echo "Moving created files to " $destiny
  echo "#############################################################################################"
    cp *$search*pkg.tar.zst $destiny
    cp *$search*pkg.tar.zst.sig $destiny

  #take special care to special packages
  if [[ $search == "perl-checkupdates-aur" ]]; then
    cp checkupdates*pkg.tar.zst $destiny
    cp checkupdates*pkg.tar.zst.sig $destiny
  fi

  if [[ $search == "droidcam" ]]; then
    gpg --detach-sign v4l2loopback-dc-dkms*pkg.tar.zst
    cp v4l2loopback-dc-dkms*pkg.tar.zst $destiny
    cp v4l2loopback-dc-dkms*pkg.tar.zst.sig $destiny
  fi

  if [[ $search == "mangohud" ]]; then
    cp mango*pkg.tar.zst $destiny
    cp mango*pkg.tar.zst.sig $destiny
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

  tput setaf 11
  echo "#############################################################################################"
  echo "###################                       build done                   ######################"
  echo "#############################################################################################"
  tput sgr0
  
  cp $pwdpath/.current-version $pwdpath/.previous-version

else

  echo "#############################################################################################"
  tput setaf 2;echo "No need to build "$name;tput sgr0
  echo "#############################################################################################"
  sleep 4
fi
