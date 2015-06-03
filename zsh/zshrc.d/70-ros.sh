# ROS
indigo() {
    CATKIN_SHELL=zsh
    source /opt/ros/indigo/setup.sh

    export PYTHONPATH=/opt/ros/indigo/lib/python2.7/site-packages:$PYTHONPATH
    export PKG_CONFIG_PATH="/opt/ros/indigo/lib/pkgconfig:$PKG_CONFIG_PATH"

    export ROS_PACKAGE_PATH=/home/paubie/uni/ros/:$ROS_PACKAGE_PATH
    export ROS_WORKSPACE=/home/paubie/uni/ros/

    # Useful aliases
    alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"

    # If you use Gazebo:
    source /usr/share/gazebo/setup.sh
}
