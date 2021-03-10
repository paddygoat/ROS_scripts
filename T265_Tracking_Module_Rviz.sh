#!/bin/bash
# cd /home/tegwyn/Desktop/ROS_startup_scripts/ && bash T265_Tracking_Module_Rviz.sh
echo whales | sudo -S jetson_clocks



source /opt/ros/melodic/setup.bash && roslaunch realsense2_camera demo_t265.launch

