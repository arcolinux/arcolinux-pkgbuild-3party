#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

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
makepkglist="brackets-bin vivaldi-codecs-ffmpeg-extra-bin icecat-bin whatsapp-nativefier faba-mono-icons-git moka-icon-theme-git"

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
  cp $search-mime*pkg.tar.zst $destiny
  cp $search-mime*pkg.tar.zst.sig $destiny
  cp $search-1*pkg.tar.zst $destiny
  cp $search-1*pkg.tar.zst.sig $destiny
else
  cp $search*pkg.tar.zst $destiny
  cp $search*pkg.tar.zst.sig $destiny
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
