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

tput setaf 2
echo "################################################################"
echo "git pull all 3th party githubs"
echo "################################################################"
tput sgr0
echo

cd ArcoLinux_3th_party

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

directories=(alpm_octopi_utils
betterlockscreen-git
ckb-next-git
cxxmatrix-git
cpufetch-git
edid-decode-git
flameshot-git
font-manager-git
gnome-shell-extension-appindicator-git
gnome-shell-extension-pop-shell-git
gnome-shell-extension-pop-shell-git
libopenmpt
mintstick-git
nodejs-nativefier
nvtop-git
numix-circle-icon-theme-git
numix-gtk-theme-git
octopi
oh-my-zsh-git
oh-my-zsh-powerline-theme-git
openbox-arc-git
paru-bin
paru-git
pikaur-git
retroarch-autoconfig-udev-git
sayonara-player
screenkey-git
speedtest-cli-git
spotifywm-git
theme.sh-git
ventoy-bin
yay-git
yin-yang-git
youtube-dl-gui-git
zscroll-git
zsh-autosuggestions-git
zsh-completions-git
zsh-history-substring-search-git
zsh-syntax-highlighting-git
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
echo "Putting on github"
echo "################################################################"
tput sgr0
echo

./1-git-v2+.sh

tput setaf 2
echo
echo "################################################################"
echo "PUtting on seedhost"
echo "################################################################"
echo
tput sgr0
echo

./2-sync-with-seedhost.sh

tput setaf 2
echo
echo "################################################################"
echo "PUtting on archive"
echo "################################################################"
echo
tput sgr0
echo

./3-sync-to-archive-seedhost.sh

echo
tput setaf 2
echo
echo "################################################################"
echo "Xlarge"
echo "################################################################"
echo
tput sgr0
echo

cd $path/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/

./1-git-*.sh
./2-sync-with-seedhost.sh
./3-sync-to-archive-seedhost.sh

echo
tput setaf 2
echo "################################################################"
echo "###################           Done        ######################"
echo "################################################################"
tput sgr0
