#!/bin/bash
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue


set -e
# checking if I have the latest files from github

path=$(echo $HOME)

echo
echo
tput setaf 2
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Building ArcoLinux_special"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd ArcoLinux_special

tput setaf 2
echo "################################################################"
echo "Building special packages"
echo "################################################################"
tput sgr0
echo

count=0

directories=(zsh-completions-git)

#for name in $(ls -d */); do
for name in "${directories[@]}"; do
	count=$[count+1]
	echo
	echo
	tput setaf 2;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	cd $name

	if [ -f .previous-version ]; then
		rm -v .previous-version
	fi
	
	sh build*

	tput setaf 3;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name"  is done!"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	echo
	echo
	echo
	cd ..

done

cd ..

tput setaf 2
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Updating all third party applications"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd ArcoLinux_3th_party

# tput setaf 2
# echo "################################################################"
# echo "git pull all 3th party githubs"
# echo "################################################################"
# tput sgr0
# echo

#./1-git-pull-all-githubs.sh

tput setaf 2
echo "################################################################"
echo "Building if needed"
echo "################################################################"
tput sgr0
echo

tput setaf 2
echo "################################################################"
echo "Building whatever"
echo "################################################################"
tput sgr0
echo

count=0


directories=(
autotiling-git
btrfs-assistant-git
btrfsmaintenance-git
cpufetch-git
edid-decode-git
flameshot-git
hyprland-git
hyprland-nvidia-git
leftwm-theme-git
mintstick-git
oh-my-zsh-git
oh-my-zsh-powerline-theme-git
numix-circle-icon-theme-git/
numix-gtk-theme-git/
numix-icon-theme-git/
numix-kde-theme-git/
paru
paru-bin
paru-git
picom-git
picom-ibhagwan-git
picom-jonaburg-git
snap-pac-git
snap-pac-grub
snapper-rollback
snapper-support
snapper-tools
snapper-tools-git
urxvt-resize-font-git
ventoy-bin
yay
yay-bin
yay-git
zsh-autosuggestions-git
zsh-fast-syntax-highlighting
zsh-history-substring-search-git
zsh-syntax-highlighting-git
zsh-theme-powerlevel10k-git
)

#for name in $(ls -d */); do
for name in "${directories[@]}"; do
	count=$[count+1]
	echo
	echo
	tput setaf 2;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	cd $name

	if [ -f .previous-version ]; then
		rm -v .previous-version
	fi

	sh build*

	tput setaf 3;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name"  is done!"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	echo
	echo
	echo
	cd ..
done

cd ..

echo
echo
tput setaf 2
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "git pull all Xlarge githubs"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd ArcoLinux_repo_xlarge

#./1-git-pull-all-githubs.sh

tput setaf 2
echo "################################################################"
echo "Building whatever"
echo "################################################################"
tput sgr0
echo

count=0

directories=()

#for name in $(ls -d */); do
for name in "${directories[@]}"; do
	count=$[count+1]
	echo
	echo
	tput setaf 2;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	cd $name

	#clear cache and build
	#sh 30-build*
	#keep cacche and build (less bandwidth)
	sh build*

	tput setaf 3;
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Building nr $count: "$name"  is done!"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	tput sgr0;
	echo
	echo
	echo
	cd ..

done

tput setaf 2
echo
echo
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Putting everything online"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

tput setaf 2
echo "################################################################"
echo "3th party repo"
echo "################################################################"
tput sgr0
echo

cd $path/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party

tput setaf 2
echo "################################################################"
echo "Putting on all githubs"
echo "################################################################"
tput sgr0
echo

./up.sh


cd $path/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/

./up.sh

echo
tput setaf 2
echo "################################################################"
echo "###################           Done        ######################"
echo "################################################################"
tput sgr0
