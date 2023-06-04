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


#set -e
# checking if I have the latest files from github

path=$(echo $HOME)

tput setaf 12
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Start from script"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

# sudo echo "start"

# tput setaf 2
# echo "################################################################"
# echo "Starting with 3th party githubs"
# echo "################################################################"
# tput sgr0
# echo

# cd ArcoLinux_3th_party

# ./1-build-all*

# cd ..

# tput setaf 12
# echo
# echo
# echo "################################################################"
# echo "################################################################"
# echo "################################################################"
# echo "CAN I PUT 3TH PARTY ONLINE?"
# echo "################################################################"
# echo "################################################################"
# echo "################################################################"
# tput sgr0
# echo

# read response

# if [[ "$response" == [yY] ]]; then

# 	echo
# 	tput setaf 2
# 	echo
# 	echo "################################################################"
# 	echo "Putting all files of 3party repo online"
# 	echo "################################################################"
# 	echo
# 	tput sgr0
# 	echo

# 	tput setaf 2
# 	echo "################################################################"
# 	echo "Going to 3th party repo"
# 	echo "################################################################"
# 	tput sgr0
# 	echo

# 	cd $path/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party

# 	tput setaf 2
# 	echo "################################################################"
# 	echo "Putting on github"
# 	echo "################################################################"
# 	tput sgr0
# 	echo

# 	./1-git.sh

# 	tput setaf 2
# 	echo
# 	echo "################################################################"
# 	echo "Putting on seedhost"
# 	echo "################################################################"
# 	echo
# 	tput sgr0
# 	echo

# 	./2-sync-with-seedhost.sh

# 	tput setaf 2
# 	echo
# 	echo "################################################################"
# 	echo "Putting on gitlab"
# 	echo "################################################################"
# 	echo
# 	tput sgr0
# 	echo

# 	./3-git-files-to-gitlab.sh

# 	tput setaf 2
# 	echo
# 	echo "################################################################"
# 	echo "Putting on archive"
# 	echo "################################################################"
# 	echo
# 	tput sgr0
# 	echo

# 	./8-sync-to-archive-seedhost.sh

#     else
    
#     echo "#############################################################################################"
#     echo "Nothing has been changed."
# fi


echo
echo
tput setaf 12
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Building all Xlarge packages"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

cd $path/ARCO/ARCOLINUX-PKGBUILD/arcolinux-pkgbuild-3party/ArcoLinux_repo_xlarge/

./1-build-all*

cd ..

tput setaf 12
echo
echo
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "CAN I PUT XLARGE PACKAGES ONLINE?"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo

read response


if [[ "$response" == [yY] ]]; then

	echo
	tput setaf 2
	echo
	echo "################################################################"
	echo "Putting all files of Xlarge repo online"
	echo "################################################################"
	echo
	tput sgr0
	echo

	cd $path/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/

	./1-git.sh
	./2-sync-with-seedhost.sh
	./8-sync-to-archive-seedhost.sh

	echo
	tput setaf 3
	echo "################################################################"
	echo "###################           Done        ######################"
	echo "################################################################"
	tput sgr0


    else
    
    echo "#############################################################################################"
    echo "Nothing has been changed."
fi




