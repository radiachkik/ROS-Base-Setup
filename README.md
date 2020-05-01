# ROS Base 

Implementation / configuration of a custom robot working ROS equipped with some extra features:

## Simulation

Gazebo is a free robotics simulator with a robust physics engine integrated into ROS (Robotic Operating System).
Since the robots hasn't been build yet, there was no need to implement the motor drivers etc.
Therefore the default drivers provided by Gazebo and ROS are used.

That means that we are able to drive the robot and to move it's arm as the simulation is running.

## Path Planning

Wether we want to move the robot itself or just it's arm, we always need some kind of path planning in order
to get the path with the minimal cost. We don't have to move every joint of the robot explicitly, but can tell a specific location, orientation and position of the arm and Mybot will find the "cheapest" path to reach that goal.

## SLAM

SLAM (Simultaneous localization and mapping) is the default method for constructing a virtuall representation
of the environment, even though not even the absolute start position is known.

MyBot uses a lidar system and a depth camera in order to obtain a high resolution 3d representation,
that is used to locate itself within this environment.

## Object Recognition

Mybot uses a naive approach of object recognition. This algorithm uses photos of the objects we want it to recognize 
(Photos have to be taken from all perspectives) and compare them to the details of the current camera input. Even though this approach is working, I will change the implementation to use the more advanced Single Shot Multibox Detector (SSD) algorithm.
