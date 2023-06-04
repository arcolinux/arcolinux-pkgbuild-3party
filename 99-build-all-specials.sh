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

directories=(zsh-completions-git numix-circle-arc-icons-git)

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
alpm_octopi_utils
betterlockscreen-git
btrfs-assistant-git
btrfsmaintenance-git
bumblebee-status-git
ckb-next-git
conky-lua-archers-git
cxxmatrix-git
cpufetch-git
curseradio-git
dracula-cursors-git
dracula-icons-git
edid-decode-git
#enlightenment-arc-theme-git
faba-icon-theme-git
faba-mono-icons-git
fancontrol-gui-git
fastfetch-git
find-the-command-git
flameshot-git
fluent-icon-theme-git
fluent-kde-theme-git
font-manager-git
fundle-git
fvwm3-git
gnome-shell-extension-appindicator-git
gnome-shell-extension-pop-shell-git
graphite-gtk-theme-git
hardcode-fixer-git
hyprland-git
hyprland-nvidia-git
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
leftwm-theme-git
legendary
lxqt-arc-dark-theme-git
mintstick-git
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
oh-my-zsh-git
oh-my-zsh-powerline-theme-git
openbox-arc-git
openbox-themes-pambudi-git
oranchelo-icon-theme-git
orchis-kde-theme-git
orchis-theme-git
papirus-folders-git
paru
paru-bin
paru-git
perl-checkupdates-aur
perl-linux-desktopfiles
perl-www-aur
picom-git
picom-ibhagwan-git
picom-jonaburg-git
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
snap-pac-git
snap-pac-grub
snapper-rollback
snapper-support
snapper-tools
snapper-tools-git
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
urxvt-resize-font-git
ventoy-bin
vimix-icon-theme-git
wacom-settings-git
we10x-icon-theme-git
whitesur-icon-theme-git
xfce4-screensaver-git
xfce4-terminal-base16-colors-git
xkblayout-state-git
xkb-switch-git
xlunch-git
xtitle-git
yay
yay-bin
yay-git
yin-yang-git
youtube-dl-gui-git
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
