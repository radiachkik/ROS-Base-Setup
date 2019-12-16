#!/bin/bash

sudo killall rosmaster
sudo killall gzserver
sudo killall gzclient
sleep 1

# load gazebo environment 
gnome-terminal -e "sh -c 'roslaunch mybot_gazebo mybot_world.launch'"
sleep 1

# load robot
gnome-terminal -e "sh -c 'roslaunch mybot_description mybot_load.launch'"
sleep 1

# run move_base and moveit!
gnome-terminal -e "sh -c 'roslaunch mybot_control myrobot_control.launch;exec bash'"
sleep 1

# run rtabmap_slam
gnome-terminal -e "sh -c 'roslaunch mybot_navigation rtabmap_slam.launch'"
sleep 1

# run rtabmap_object_recognition
gnome-terminal -e "sh -c 'roslaunch mybot_object_recognition rtabmap_object_recognition.launch'"
sleep 1

# start rviz // gui
gnome-terminal -e "sh -c 'roslaunch mybot_description mybot_rviz.launch'"
