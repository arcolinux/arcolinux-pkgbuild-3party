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

#for name in $(ls -d */ | cut -f1 -d'/' | tac )
for name in $(ls -d */ | cut -f1 -d'/'); do
	count=$[count+1]
	cd $name
	tput setaf 3
	echo "--################Github nr : " $count " - git pull of " $name
	tput sgr0
	echo "#############################################################################################"
	git pull
	
	# pkgver=$(grep -m1 "pkgver" PKGBUILD | cut -d= -f2)
	# pkgrel=$(grep -m1 "pkgrel" PKGBUILD | cut -d= -f2)
	# epoch=$(grep -m1 "epoch" PKGBUILD | cut -d= -f2)
	# oldpkgver=$(grep -m1 "pkgver" .previous-version | cut -d= -f2)
	# oldpkgrel=$(grep -m1 "pkgrel" .previous-version | cut -d= -f2)
	# oldepoch=$(grep -m1 "epoch" .previous-version | cut -d= -f2)

	
		# if [[ $pkgver != $oldpkgver  ||  $pkgrel != $oldpkgrel  || $epoch != $oldepoch ]] ; then
		# tput setaf 3;
		# echo "#############################################################################################"
		# echo "Previous version"
		# echo "######################"
		# echo "oldpkgver = "$oldpkgver
		# echo "oldpkgrel = "$oldpkgrel
		# echo "oldepoch = "$oldepoch
		# echo "######################"
		# echo "New version"
		# echo "######################"
		# echo "pkgver = "$pkgver
		# echo "pkgver="$pkgver > .current-version
		# echo "pkgrel = "$pkgrel
		# echo "pkgrel="$pkgrel >> .current-version
		# echo "epoch = "$epoch
		# echo "epoch="$epoch >> .current-version
		# echo "We need to build "$name
		# tput sgr0
		sh ./build*
		# cp .current-version .previous-version
		# echo "Current version is now same as previous version"
		# else
		# echo "#############################################################################################"
		# tput setaf 2;echo "No need to build "$name;tput sgr0
		# echo "#############################################################################################"
		# fi
	cd ..
done
