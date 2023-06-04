#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
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

echo "#################################################"
echo "################   Removing .tar.gz"
echo "#################################################"
rm ArcoLinux*.tar.gz
rm Special.tar.gz

directories=(ArcoLinux_3th_party
ArcoLinux_repo_iso
ArcoLinux_repo_xlarge
ArcoLinux_special
Special
)

count=0

for name in "${directories[@]}"; do
	count=$[count+1]
	echo "#################################################"
	echo "################  $name start"
	echo "#################################################"
	echo
	tput setaf 1;echo "Compressing .... "$count;tput sgr0;
	echo
	tar -czf $name.tar.gz $name
	echo
	echo "#################################################"
	echo "################  $name done"
	echo "#################################################"
done


# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo "#################################################"
echo "################   Removing .tar.gz"
echo "#################################################"

rm ArcoLinux*.tar.gz
rm Special.tar.gz

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
