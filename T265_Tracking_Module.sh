#!/bin/bash
# cd /home/tegwyn/Desktop/ROS_startup_scripts/ && bash T265_Tracking_Module.sh
echo whales | sudo -S jetson_clocks

gnome-terminal --geometry=60x35-800+0 -- bash -c "echo 'Waiting for ROS publisher to initialise ... ' && \
source /opt/ros/melodic/setup.bash && \
roslaunch realsense2_camera rs_t265.launch \
; exec bash"

gnome-terminal --geometry=60x35-0+0 -- bash -c "echo 'Waiting for ROS publisher to initialise ... ' && \
sleep 5 && \
source /opt/ros/melodic/setup.bash && \
rostopic echo /tf \
; exec bash"



