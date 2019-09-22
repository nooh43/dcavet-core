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

# Step 1 : Updating the systems
echo -ne "SYSTEM UPDATE               [\e[1;30;1;1;47min progress\e[0m]\r"
{
    sudo yum -y update
} > logs/logs/installation.log 2> logs/errors/installation.log
echo -ne "SYSTEM UPDATE               [\e[1;37;1;1;42m   +done   \e[0m]"
echo

# Step 2 : Installing epel
echo -ne "EPEL INSTALLATION           [\e[1;30;1;1;47min progress\e[0m]\r"
{
    sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum -y update
} > logs/logs/installation.log 2> logs/errors/installation.log
echo -ne "EPEL INSTALLATION           [\e[1;37;1;1;42m   +done   \e[0m]"
echo

# Step 3 : Installing esential packages
echo -ne "PACKAGES INSTALLATION       [\e[1;30;1;1;47min progress\e[0m]\r"
{
    sudo yum -y install nano wget git mariadb-server mariadb
} > logs/logs/installation.log 2> logs/errors/installation.log
echo -ne "PACKAGES INSTALLATION       [\e[1;37;1;1;42m   +done   \e[0m]"
echo

# Step 4 : Setting up mariadb
echo -ne "SETTING MARIADB       [\e[1;30;1;1;47min progress\e[0m]\r"
{
    sudo systemctl start mariadb
    sudo systemctl enable mariadb.service
} > logs/logs/installation.log 2> logs/errors/installation.log
echo -ne "SETTING MARIADB       [\e[1;37;1;1;42m   +done   \e[0m]"
echo

# The End
echo
echo -e "\e[31;1m  Awesome, Everything is set, Thank you.  \e[0m"