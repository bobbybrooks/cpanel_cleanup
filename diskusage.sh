#!/bin/bash
# FirstDomain.com
# Change these variables
domainName=$(echo "ftp.firstdomain.com")
userName=$(echo "username1")
# This is 10 MB
availSpace=$(echo "10000")
ssh -p 1234 $userName@$domainName -t "du ~ > ./fileusage.txt"
scp -P 1234 $userName@$domainName:fileusage.txt ~/Documents/Website_Cleanup/$userName-fileusage.txt
ssh -p 1234 $userName@$domainName -t "rm -rf ~/fileusage.txt"
usedSpace=$(tail -1 $userName-fileusage.txt | sed "s@home@$availSpace@g" | sed 's/\t//g' | cut -d "/" -f 1)
percentUsed=$(echo "$usedSpace/$availSpace" | bc -l)
echo "$userName     $percentUsed" >> ./current-diskusage.txt

# SecondDomain.com
# Change these variables
userName=$(echo "username2")
domainName=$(echo "ftp.seconddomain.com")
domainName=$(echo "ftp.firstdomain.com")
userName=$(echo "username1")
# This is 10 MB
availSpace=$(echo "10000")
ssh -p 1234 $userName@$domainName -t "du ~ > ./fileusage.txt"
scp -P 1234 $userName@$domainName:fileusage.txt ~/Documents/Website_Cleanup/$userName-fileusage.txt
ssh -p 1234 $userName@$domainName -t "rm -rf ~/fileusage.txt"
usedSpace=$(tail -1 $userName-fileusage.txt | sed "s@home@$availSpace@g" | sed 's/\t//g' | cut -d "/" -f 1)
percentUsed=$(echo "$usedSpace/$availSpace" | bc -l)
echo "$userName     $percentUsed" >> ./current-diskusage.txt


