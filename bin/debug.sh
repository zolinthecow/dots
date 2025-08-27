#!/usr/bin/env bash

if [ $2 -ne "1" ] && [ $2 -ne "2" ]
then
	echo "Please enter 1 (normal) or 2 (tree)"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "That directory does not exist"
	exit 1
fi

sed 's/setIO()/setIO("'$1'")/g' $HOME/src/cc/utils/template.cpp > $1/brute.cpp
code --user-data-dir ~/.vscode/profiles/competitive/data $1/brute.cpp

if [ $2 -eq "1" ]
then
	cp $HOME/src/cc/utils/gen.cpp $1/ 
	code --user-data-dir ~/.vscode/profiles/competitive/data $1/gen.cpp
else
    cp $HOME/src/cc/utils/gentree.cpp $1/
    code --user-data-dir ~/.vscode/profiles/competitive/data $1/gentree.cpp 
fi

cp $HOME/src/cc/utils/s.sh $1/
code --user-data-dir ~/.vscode/profiles/competitive/data $1/s.sh
