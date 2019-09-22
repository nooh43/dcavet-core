#!/bin/bash
# dcavet-core : installation file of dcavet-core, which cointain commands to insure that
#               everything in place ready for processing.
# Version : V 0.1
# Author  : Nasser Alhumood
# .-.    . . .-.-.
# |.|.-.-|-.-|-`-..-,.-.. .
# `-``-`-'-' ' `-'`'-'   `
clear

# Some Unnecessary Variables, but they're here anyway
version=V0.1
oss="CentOs7, RHEL7"

# Welcome Massage
echo -e "\e[1;34;1m+==============================================\e[0m"
echo -e "\e[1;34;1m+\e[0m" "DCAVET Core -  " $version
echo -e "\e[1;34;1m+\e[0m" "supported operating systems: " $oss
echo -e "\e[1;34;1m+==============================================\e[0m"
echo
echo

# Making sure you wanna continue
echo "Don't close the application and wait unil it is completed."
echo "You should be patient if you want to continue..."
echo
read -p "Would you like to continue ? [y/N] "
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo No problem, goodbye!
    exit 0
fi