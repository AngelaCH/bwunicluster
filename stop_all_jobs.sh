#!/bin/bash
# Description:	This script cancels all your jobs.
# Author:	Sven Wehner <wehner@informatik.uni-freiburg.de>
# Date:		2014-05-20

# ask the user for permission
while true; do
    read -p "Do you really want to cancel all your jobs? (yes|no) " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# cancel all jobs belonging to the current user
mjobctl -c -w user=$(whoami)
