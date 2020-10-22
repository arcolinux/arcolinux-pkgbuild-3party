#!/bin/bash
set -e
# checking if I have the latest files from github
tput setaf 2
echo "################################################################"
echo "Updating all third party applications"
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

./2-detect-version.sh

cd ..
echo
echo
tput setaf 2
echo "################################################################"
echo "git pull all xlarge githubs"
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

./2-detect-version.sh

cd ..

tput setaf 2
echo
echo
echo "################################################################"
echo "Putting everything online"
echo "################################################################"
tput sgr0
echo

tput setaf 2
echo "################################################################"
echo "3th party"
echo "################################################################"
tput sgr0
echo

cd /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party

./1-git-v2+.sh
./2-sync-with-seedhost.sh
./3-sync-to-archive-seedhost.sh

echo
tput setaf 2
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo
echo
echo "################################################################"
echo "Xlarge"
echo "################################################################"
tput sgr0
echo

cd /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_xlarge/

./1-git-v3.sh
./2-sync-with-seedhost.sh
./3-sync-to-archive-seedhost.sh

echo
tput setaf 2
echo "################################################################"
echo "###################           Done        ######################"
echo "################################################################"
tput sgr0
