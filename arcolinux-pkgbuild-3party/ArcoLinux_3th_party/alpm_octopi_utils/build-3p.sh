#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

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
makepkglist="bash-pipes bibata-cursor-theme betterlockscreen cmatrix-git conky-lua-archers dbus-go dwm font-manager-git \
 gksu hw-probe libgksu lxqt-arc-dark-theme-git obmenu-generator mintlocale \
 mintstick-git numix-kde-theme-git numix-circle-arc-icons-git numix-circle-icon-theme-git octopi perl-checkupdates-aur \
 perl-checkupdates-aur python2-notify radiotray screenkey-git sutils-git systemd-manager surfn-mint-y-icons-git xdgmenumaker xmonad-log"

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
  echo "#########        Let us build the package in CHROOT "$(basename `pwd`)
  echo "#############################################################################################"
  tput sgr0
  CHROOT=$HOME/Documents/chroot-arcolinux
  arch-nspawn $CHROOT/root pacman -Syu
  makechrootpkg -c -r $CHROOT

  echo "Signing the package"
  echo "#############################################################################################"
  gpg --detach-sign $search*pkg.tar.zst

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
cp $search*pkg.tar.zst $destiny
cp $search*pkg.tar.zst.sig $destiny

#take special care to special packages
if [[ $search == "perl-checkupdates-aur" ]]; then
  cp checkupdates*pkg.tar.zst $destiny
  cp checkupdates*pkg.tar.zst.sig $destiny
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

tput setaf 8
echo "#############################################################################################"
echo "###################                       build done                   ######################"
echo "#############################################################################################"
tput sgr0
