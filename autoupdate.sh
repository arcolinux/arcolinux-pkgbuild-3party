#!/bin/bash

cd ArcoLinux_3th_party

sh 1-git-pull-all-githubs.sh

sh 2-detect-version.sh

cd ..

cd ArcoLinux_repo_xlarge

sh 1-git-pull-all-githubs.sh

sh 2-detect-version.sh

cd ..

cd ..

cd ..

cd ARCOLINUX-REPO

cd arcolinux_repo_3party

sh git-v2+.sh

cd ..

cd arcolinux_repo_xlarge

sh git-v3.sh

echo "################################################################"
echo "###################    updates done       ######################"
echo "################################################################"
