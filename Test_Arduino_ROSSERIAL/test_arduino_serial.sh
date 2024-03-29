#!/bin/bash
# cd /home/pi/Desktop/ROS_startup_scripts/ && bash test_arduino_serial.sh

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Test Arduino ROS set up.${NC}\n" 
echo ""

xdotool getactivewindow windowmove 0 100 windowsize 600 370 && lxterminal --command='./terminal_1.sh' &
sleep 5

xdotool getactivewindow windowmove 600 100 windowsize 600 370 && lxterminal --command='./terminal_2.sh' &
sleep 10

xdotool getactivewindow windowmove 0 500 windowsize 600 370 && lxterminal --command='./terminal_3.sh' &
sleep 5


xdotool getactivewindow windowmove 600 500 windowsize 600 370 &&
sleep 5

printf "${GREEN}All done.${NC}\n"
echo ""