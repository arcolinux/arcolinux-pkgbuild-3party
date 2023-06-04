#!/bin/bash
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

directories=(
ArcoLinux_3th_party
ArcoLinux_repo_iso
ArcoLinux_repo_xlarge
ArcoLinux_special
Gone
Moved-to-Arch-Linux
Special)

count=0

for name in "${directories[@]}"; do
	count=$[count+1]
	tput setaf 1;echo "Compressing "$count;tput sgr0;
	tar -czf $name.tar.gz $name
	echo "#################################################"
	echo "################  "$(basename `pwd`)" done"
	echo "#################################################"
done



# echo "Copy to just coreteam"
targetdir="/home/erik/Dropbox/Backup/arcolinux-pkgbuild-3party"
[ -d $targetdir ] || mkdir -p $targetdir
mv  *.tar.gz  $targetdir
