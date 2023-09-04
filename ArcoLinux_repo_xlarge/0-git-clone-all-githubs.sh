#!/bin/bash
echo "This updates the existing githubs"
echo "Fill the array with the original folders first"

# use ls -d */ > list to get the list of the created githubs and copy/paste in

directories=(
airdroid-nativefier/
brackets-bin/
brave-bin/
dropbox/
electron13-bin/
etcher-bin/
flat-remix-git/
fluent-icon-theme-git/
freeoffice/
freetube-bin/
geekbench/
github-desktop-bin/
gitfiend/
gitkraken/
google-chat-linux-bin/
google-chrome/
google-earth-pro/
heroic-games-launcher-bin/
icecat/
insync/
jitsi-meet-desktop-bin/
librewolf-bin/
losslesscut-bin/
mailspring/
moka-icon-theme-git/
moneydance/
mullvad-vpn-bin/
neverball/
nomachine/
nordpass-bin/
nordzy-icon-theme-git/
onlyoffice-bin/
openoffice-bin/
paper-icon-theme/
plex-media-player/
plex-media-server/
proton-ge-custom-bin/
protonup-qt-bin
pulsar-bin/
telegram-desktop-bin/
signal-desktop-beta-bin/
slack-desktop
skypeforlinux-stable-bin/
spotify/
tabby-bin/
teams/
tela-circle-icon-theme-git/
tor-browser/
viber/
visual-studio-code-bin/
vscodium-bin/
vmware-workstation/
whatsapp-nativefier/
wps-office/
zoom/
)

count=0

for name in "${directories[@]}"; do
	count=$[count+1]
	tput setaf 1;echo "Github "$count;tput sgr0;
	git clone https://aur.archlinux.org/$name
	#sleep 1
	echo "#################################################"
	echo "################  "$(basename `pwd`)" done"
	echo "#################################################"
done
