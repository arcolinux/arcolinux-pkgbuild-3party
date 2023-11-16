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

cd /home/erik/ARCO/ARCOLINUX-PKGBUILD/arcolinux-pkgbuild-3party/ArcoLinux_special

tput setaf 2
echo "################################################################"
echo "Building special packages"
echo "################################################################"
tput sgr0
echo

count=0

directories=(numix-circle-arc-icons-git)

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
echo "Building ArcoLinux_3th_party"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd /home/erik/ARCO/ARCOLINUX-PKGBUILD/arcolinux-pkgbuild-3party/ArcoLinux_3th_party


tput setaf 2
echo "################################################################"
echo "Building whatever"
echo "################################################################"
tput sgr0
echo

count=0


directories=(aic94xx-firmware
alpm_octopi_utils
betterlockscreen-git
bumblebee-status-git
catch2-git
ckb-next-git
conky-lua-archers-git
cxxmatrix-git
curseradio-git
dracula-cursors-git
dracula-icons-git
#enlightenment-arc-theme-git
faba-icon-theme-git
faba-mono-icons-git
fancontrol-gui-git
fastfetch-git
find-the-command-git
fluent-kde-theme-git
font-manager-git
fundle-git
fvwm3-git
g4music
gnome-shell-extension-appindicator-git
gnome-shell-extension-pop-shell-git
graphite-gtk-theme-git
hardcode-fixer-git
i3lock-color
imagewriter
kripton-theme-git
kvantum-theme-qogir-git
kwin-bismuth
kwin-scripts-forceblur
kwin-scripts-krohnkite-git
layan-cursor-theme-git
layan-gtk-theme-git
layan-kde-git
la-capitaine-icon-theme-git
legendary
lxqt-arc-dark-theme-git
modprobed-db
modprobed-db-git
mono-zeroconf-git
multimc-git
nodejs-nativefier
nordic-kde-git
numix-circle-icon-theme-git
numix-gtk-theme-git
numix-icon-theme-git
numix-kde-theme-git
nvtop-git
octopi
openbox-arc-git
openbox-themes-pambudi-git
oranchelo-icon-theme-git
orchis-kde-theme-git
orchis-theme-git
papirus-folders-git
perl-checkupdates-aur
perl-linux-desktopfiles
perl-www-aur
pikaur-git
plymouth-git
pop-launcher-git
pop-shell-shortcuts-git
protontricks-git
protonup-git
qogir-gtk-theme-git
qogir-kde-theme-git
qtwebflix-git
quickemu-git
retroarch-autoconfig-udev-git
rtl8821cu-morrownr-dkms-git
sayonara-player
screenkey-git
sddm-sugar-candy-git
simplicity-sddm-theme-git
sparklines-git
speedtest-cli-git
spotify-adblock-git
spotifywm-git
sutils-git
sweet-theme-git
taglib-sharp-git
tempus-themes-xfce4-terminal-git
thunar-shares-plugin-git
tty-clock-git
ttf-hactor
tuxboot-git
ufetch-git
unimatrix-git
vimix-icon-theme-git
wacom-settings-git
we10x-icon-theme-git
whitesur-icon-theme-git
xfce4-panel-profiles
xfce4-screensaver-git
xfce4-terminal-base16-colors-git
xkblayout-state-git
xkb-switch-git
xlunch-git
xtitle-git
yin-yang-git
youtube-dl-gui
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
echo "Building all Xlarge githubs"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd /home/erik/ARCO/ARCOLINUX-PKGBUILD/arcolinux-pkgbuild-3party/ArcoLinux_repo_xlarge


tput setaf 2
echo "################################################################"
echo "Building ArcoLinux_repo_xlarge"
echo "################################################################"
tput sgr0
echo

count=0

directories=(fluent-icon-theme-git nordzy-icon-theme-git)

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

cd /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/

./up.sh

tput setaf 2
echo "################################################################"
echo "Xlarge repo"
echo "################################################################"
tput sgr0
echo

cd /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/

./up.sh

echo
tput setaf 2
echo "################################################################"
echo "###################           Done        ######################"
echo "################################################################"
tput sgr0
