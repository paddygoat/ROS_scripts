#!/bin/bash
# cd /home/tegwyn/Desktop/ROS_startup_scripts/ && bash Ublox_navpvt.sh
echo whales | sudo -S jetson_clocks
echo whales | sudo chmod 666 /dev/ttyACM0


gnome-terminal --geometry=60x35-800+0 -- bash -c "echo 'Waiting for ROS publisher to initialise ... ' && \
source /opt/ros/melodic/setup.bash && \
source /home/tegwyn/catkin_ws/devel/setup.bash && \
roslaunch ublox_gps ublox_zed-f9p.launch \
; exec bash"

gnome-terminal --geometry=60x35-0+0 -- bash -c "echo 'Waiting for ROS publisher to initialise ... ' && \
sleep 10 && \
source /opt/ros/melodic/setup.bash && \
source /home/tegwyn/catkin_ws/devel/setup.bash && \
rostopic echo /ublox_gps/navpvt \
; exec bash"



