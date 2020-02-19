#!/bin/bash
# This is a modified an example from the tutorial using if statements

# 2/17/2020 wagne216- Danielle W.
# Goal: Back up a directory into the directory ~/backups/['folder being backed up'_date]
# To Run: ./wagne216_my_backup.sh [path of folder being backed up] 

if [ $# != 1 ] # note spaces. asking if no. arg's($#) not equal (!=) 1
then
	echo Usage: Please enter only a single argument which is the directory to backup # this displays if incorrect input	
	exit # because there should only be one argument

fi # if end
if [ ! -d ~/$1 ] # (if the directory given in the argument does not exist)
then
	echo 'The given directory does no  seem to exist (possible type?)'
	exit

fi
date=`date +%F`

# did we laready have a backup folder for today's date?
if [ -d ~/projectbackups/$1_$date ]
then
	echo 'This project has already been backed up today, overwrite?'
	read answer # 'read' takes 1 argument, which stores user response
	if [ $answer != 'y' ] # if 'yes'
	then
		exit # to avoid creating second folder with same date
	fi
else
	mkdir ~/backups/$1_$date # creates dated folder
fi
cp -R ~/$1 ~/backups/$1_$date # copies desired folderk to new folder
echo Backup of $1 complete

