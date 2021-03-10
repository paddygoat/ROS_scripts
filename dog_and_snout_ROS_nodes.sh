#!/bin/bash
# cd ~/Desktop/ROS_startup_scripts && bash dog_and_snout_ROS_nodes.sh



RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Dog node is up!${NC}\n" 

printf "${GREEN}Start dog and snout nodes ....${NC}\n"
echo ""



gnome-terminal --geometry=80x30-1000+600 -- bash -c "\
source /opt/ros/melodic/setup.bash && \
source /home/tegwyn/catkin_ws/devel/setup.bash && \
roslaunch ublox_dog_gps ublox_dog_zed-f9p.launch \
; exec bash"



sleep 10


gnome-terminal --geometry=80x30-200+670 -- bash -c "\
source /opt/ros/melodic/setup.bash && \
source /home/tegwyn/catkin_ws/devel/setup.bash && \
roslaunch ublox_snout_gps ublox_snout_zed-f9p.launch \
; exec bash"



