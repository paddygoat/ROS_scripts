#!/bin/bash
# cd ~/Desktop/ROS_startup_scripts && bash run_all_scripts.sh

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Run all scripts${NC}\n" 
sleep 5

sh ./find_computers_on_network.sh

printf "${GREEN}Start dog and snout nodes ....${NC}\n"
echo ""
sleep 10

sh ./dog_and_snout_ROS_nodes.sh

printf "${GREEN}Run combined dog and snout for GPS and heading data ....${NC}\n"
echo ""
sleep 10

sh ./run_combined_dog_snout.sh
