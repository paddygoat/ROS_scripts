#!/bin/bash
# cd /home/tegwyn/Desktop/ROS_startup_scripts/ && bash build_dog.sh
echo ##### | sudo -S jetson_clocks
echo ##### | sudo chmod 666 /dev/ttyACM0


source /opt/ros/melodic/setup.bash
rm -rf /home/tegwyn/catkin_ws/src/ublox_dog
cd ~/catkin_ws/src/
# git clone https://github.com/bao-eng/ublox.git
git clone https://github.com/paddygoat/ublox_dog.git
cd ~/catkin_ws/src/ublox_dog/
git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`
cd ~/catkin_ws/src/
rm /home/tegwyn/catkin_ws/src/CMakeLists.txt
catkin_init_workspace
cd ~/catkin_ws/
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install
cd

source /opt/ros/melodic/setup.bash
source /home/tegwyn/catkin_ws/devel/setup.bash



