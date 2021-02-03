#!/bin/bash
echo "This updates the existing githubs"
echo "Fill the array with the original folders first"

# use ls -d */ > list to get the list of the created githubs and copy/paste in

directories=(
bitwarden-bin/
brackets-bin/
brave-bin/
dropbox/
enpass-bin/
etcher-bin/
faba-icon-theme-git/
faba-mono-icons-git/
gitfiend/
gitkraken/
google-chrome/
google-earth-pro/
icecat-bin/
insync/
minecraft-launcher/
moka-icon-theme-git/
moneydance/
neverball/
onlyoffice-bin/
plex-media-player/
plex-media-server/
slack-desktop
skypeforlinux-stable-bin/
spotify/
teams/
tor-browser/
ttf-wps-fonts/
viber/
visual-studio-code-bin/
whatsapp-nativefier/
wps-office/
zoom/
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
