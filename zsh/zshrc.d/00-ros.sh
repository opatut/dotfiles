# set_ros_workspace () {
#     source $1/devel/setup.zsh
#     export PYTHONPATH=$1/devel/lib/python2.7/site-packages/:$PYTHONPATH
#     export ROS_WORKSPACE=$1
#     export ROS_PACKAGE_PATH=$1:$ROS_PACKAGE_PATH
#
#     # Useful aliases
#     alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"
# }
#
# source /opt/ros/melodic/setup.zsh
# export PYTHONPATH=/opt/ros/melodic/lib/python2.7/site-packages:$PYTHONPATH
# export PKG_CONFIG_PATH="/opt/ros/melodic/lib/pkgconfig:$PKG_CONFIG_PATH"

# set_ros_workspace $HOME/src/ros

