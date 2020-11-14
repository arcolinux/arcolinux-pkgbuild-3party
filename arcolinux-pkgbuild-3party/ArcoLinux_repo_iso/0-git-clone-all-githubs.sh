#!/bin/bash
echo "This updates the existing githubs"
echo "Fill the array with the original folders first"

# use ls -d */ > list to get the list of the created githubs and copy/paste in

directories=(
ckbcomp/
mkinitcpio-openswap/
)

count=0

for name in "${directories[@]}"; do
	count=$[count+1]
	tput setaf 1;echo "Github "$count;tput sgr0;
	git clone https://aur.archlinux.org/$name
	echo "#################################################"
	echo "################  "$(basename `pwd`)" done"
	echo "#################################################"
done
