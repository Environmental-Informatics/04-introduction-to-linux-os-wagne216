#!/bin/bash
# script created to inquire and report info about a requested directory
# created 2/18/2020 by wagne216- Danielle W. 
# To Run: ./wagne216_dir_info.sh [filename]


date=`date +%F`
if [ ! -d ~/$1 ] # (if the directory given in the argument does not exist)
then
	mkdir ~/ABE651/file_report
        echo 'file_report created)'
        exit

fi


# fl=`~/ABE651/file_report/$1_$date`

echo Directory Report for $1 

# Questions
# no. files in directory:
echo 1. No. files in $1: > ~/ABE651/file_report/$1_$date
ls -l ~/*$1 | wc -l  >> ~/ABE651/file_report/$1_$date 

# no. directories in directory: 
echo '2. No. directories in' $1 ':' >> ~/ABE651/file_report/$1_$date
ls -d ~/*$1 | wc -l  >> ~/ABE651/file_report/$1_$date

# most recently modified file:
echo '3. Most recently modded file in' $1 ':' >> ~/ABE651/file_report/$1_$date
ls -t ~/*$1 | head -1 >> ~/ABE651/file_report/$1_$date  # sorts by most recently modified, then takes first

# list of directory owners:
echo '4. Owners of $1 ' $1 ':' >> ~/ABE651/file_report/$1_$date
ls -ld ~/*$1 | cut -f 3 -d ' '  >> ~/ABE651/file_report/$1_$date  # shows info then 3rd column

# file owner permissions: 
echo  $1 '5. Permissions granted to owner:' >> ~/ABE651/file_report/$1_$date
ls -ld ~/*$1 | cut -b 2,3,4  >> ~/ABE651/file_report/$1_$date 

