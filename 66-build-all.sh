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

yes | sudo pacman -Scc

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

./1-git-pull-all-githubs.sh

tput setaf 2
echo "################################################################"
echo "Building if needed"
echo "################################################################"
tput sgr0
echo

./66-build-all-packages.sh

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

./1-git-pull-all-githubs.sh

tput setaf 2
echo "################################################################"
echo "Building if needed"
echo "################################################################"
tput sgr0
echo

./66-build-all-packages.sh

cd ..

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

./1-git-v3.sh
./2-sync-with-seedhost.sh
./3-sync-to-archive-seedhost.sh

echo
tput setaf 2
echo "################################################################"
echo "###################           Done        ######################"
echo "################################################################"
tput sgr0
