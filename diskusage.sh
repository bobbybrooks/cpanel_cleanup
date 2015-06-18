#!/bin/bash
# FirstDomain.com
# Change these variables
userName=$(echo "username1")
domainName=$(echo "ftp.firstdomain.com")
ssh -p 1234 $userName@$domainName -t "du ~ > ./fileusage.txt"
scp -P 1234 $userName@$domainName:fileusage.txt ~/Documents/Website_Cleanup/$userName-fileusage.txt
ssh -p 1234 $userName@$domainName -t "rm -rf ~/fileusage.txt"

# SecondDomain.com
# Change these variables
userName=$(echo "username2")
domainName=$(echo "ftp.seconddomain.com")
ssh -p 1234 $userName@$domainName -t "du ~ > ./fileusage.txt"
scp -P 1234 $userName@$domainName:fileusage.txt ~/Documents/Website_Cleanup/$userName-fileusage.txt
ssh -p 1234 $userName@$domainName -t "rm -rf ~/fileusage.txt"
