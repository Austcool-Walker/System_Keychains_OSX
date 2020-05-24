#!/bin/bash

echo Please read the Readme before proceeding with this!

while true
do
  # (1) prompt user, and read command line argument
  read -p "Do you really want to replace the original system security certificates with updated ones from OS X 10.12 (Y/N)? " answer

  # (2) handle the input we were given
  case $answer in
   [yY]* )

echo In case you are prompted to enter a password, please enter the super user password

CURDIR=$(dirname "$0")

sudo ditto -V "$CURDIR/Keychains" /System/Library/Keychains

sudo chown -v -R root:wheel /System/Library/Keychains

sudo rm -v /var/db/crls/crlcache.db /var/db/crls/ocspcache.db

           break;;

   [nN]* ) exit;;

   * )     echo "Dude, just enter Y or N, please.";;
  esac
done
