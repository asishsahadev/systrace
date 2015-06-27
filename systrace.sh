#! /bin/bash
# The script will display the system calls that are present in the Android source code along with their count. 
# SYNTAX:   ./systrace pathtoAndroidSrc 

#Requires the pattern file to be in Android Src directory

if [ ! -d "$1" ] ; then
	echo -e "No such directory exists.\n usage: ./systrace Path-to-Andoid-KernelSrc "
exit 1
fi
 
if [ $# -eq 0 ] ; then
	echo -e "usage: ./systrace Path-to-Android-KernelSrc"
exit 1
fi

echo -e "Tracing syscalls in Android Source and their number of occurences.\n The script requires the pattern file to be present in Android Src. The pattern file should be renamed as pattern.txt"


PATTERN=$1/pattern.txt
echo -e "\n Count  System Call "
echo -e "-----------------------\n"
grep -R -o -f pattern.txt --exclude=calls.S --exclude=syscalls.h $1/arch/arm $1/drivers/ $1/fs/ $1/include/ $1/init/ $1/ipc/ $1/kernel/ $1/lib/ $1/mm/ $1/net/ $1/security/ $1/sound/ $1/tools/ | cut -d ":" -f2 |sort|uniq -c

echo -e "Total number of system calls invoked:" 

grep -R -o -f pattern.txt --exclude=calls.S --exclude=syscalls.h $1/arch/arm $1/drivers/ $1/fs/ $1/include/ $1/init/ $1/ipc/ $1/kernel/ $1/lib/ $1/mm/ $1/net/ $1/security/ $1/sound/ $1/tools/ | cut -d ":" -f2 |sort|uniq -c|wc -l
 
