#!/bin/bash
# cd ~/Desktop/ROS_startup_scripts && bash run_combined_dog_snout.sh



gnome-terminal --geometry=80x30-750+500 -- bash -c "\
source /opt/ros/melodic/setup.bash && \
source /home/tegwyn/catkin_ws/devel/setup.bash && \
python /home/tegwyn/catkin_ws/src/dog_snout/src/combine_dog_snout.py \
; exec bash"


