#!/bin/bash
echo "This updates the existing githubs"
echo "Fill the array with the original folders first"

# use ls -d */ > list to get the list of the created githubs and copy/paste in

directories=(
alpm_octopi_utils/
arc-kde/
autotiling/
bash-pipes/
bibata-cursor-theme/
boxes/
caffeine/
caffeine-ng/
cava/
cmatrix-git/
cnijfilter2-mg7700/
conky-lua-archers/
cpufetch-git/
curseradio-git/
dbus-go/
downgrade/
edid-decode-git/
enlightenment-arc-theme-git/
focuswriter/
font-manager-git/
gconf/
ghostwriter/
gitahead-bin/
gksu/
glxinfo/
gnome-shell-extension-appindicator-git/
gotop-bin/
halo-icons-git/
hardcode-fixer-git/
halo-icons-git/
hw-probe/
i3lock-color/
imagewriter/
inxi/
iso-flag-png/
ksuperkey/
lastpass/
libgksu/
lxqt-arc-dark-theme-git/
mate-tweak/
menulibre/
mintlocale/
mintstick-git/
mugshot/
nodejs-nativefier/
numix-circle-arc-icons-git/
numix-circle-icon-theme-git/
numix-gtk-theme-git/
numix-icon-theme-git/
numix-kde-theme-git/
obkey-git/
obmenu3/
obmenu-generator/
ocs-url/
octopi/
oh-my-zsh-git/
openbox-arc-git/
openbox-themes-pambudi-git/
optimus-manager/
oxy-neon/
pacback/
pamac-aur/
perl-checkupdates-aur/
perl-linux-desktopfiles/
perl-www-aur/
polybar/
pygtk/
python-pyparted/
radiotray/
scangearmp2-mg7700/
screenkey-git/
slstatus-git/
slurm/
spotifywm-git/
stacer/
sublime-text-dev/
sutils-git/
systemd-kcm/
systemd-manager/
the_platinum_searcher-bin/
timeshift
thunar-shares-plugin/
toilet/
trizen/
ttf-ms-fonts/
tty-clock/
ufetch-git/
urxvt-resize-font-git/
ventoy-bin/
woeusb/
wttr/
xcursor-breeze/
xdgmenumaker/
xfce4-panel-profiles/
xmonad-log/
xtitle-git/
yay-bin/
zafiro-icon-theme/
zsh-completions-git/
zsh-syntax-highlighting-git/
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
