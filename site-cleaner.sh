#!/bin/bash
# This sequentially connects to firstdomain, seconddomain, and thirddomain and clears the ~/tmp folder.
# Change port number/username/domain
ssh -p 1234 username1@ftp.firstdomain.com -t "rm -rf ~/tmp/*"
ssh -p 1234 username2@ftp.seconddomain.com -t "rm -rf ~/tmp/*"
ssh -p 1234 username3@ftp.thirddomain.com -t "rm -rf ~/tmp/*"

