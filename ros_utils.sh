# Mojin
use-ros1 () 
{
	unset ROS_VERSION
    unset ROS_PYTHON_VERSION
    unset ROS_DOMAIN_ID
    unset ROS_LOCALHOST_ONLY
    unset ROS_DISTRO

	source /opt/ros/noetic/setup.sh
}

use-ros2 ()
{
    pushd . > /dev/null
    unset ROS_VERSION
	unset ROS_PYTHON_VERSION
	unset ROS_PACKAGE_PATH
	unset ROSLISP_PACKAGE_DIRECTORIES
	unset ROS_MAVEN_PATH
	unset ROS_ETC_DIR
	unset ROS_MAVEN_REPOSITORY
	unset ROS_MASTER_URI
	unset ROS_MAVEN_DEPLOYMENT_REPOSITORY
	unset ROS_ROOT
	unset ROS_DISTRO
	export ROS_DOMAIN_ID=99
    
    source /opt/ros/foxy/setup.bash
    source ~/ros2_ws/install/local_setup.bash
	popd > /dev/null
}

use-ros-both () 
{
    source /opt/ros/noetic/setup.sh

    pushd . > /dev/null
    export ROS_DOMAIN_ID=99
    
    source /opt/ros/foxy/local_setup.bash
    source ~/ros2_ws/install/local_setup.bash
    source /usr/share/colcon_cd/function/colcon_cd.sh
    popd > /dev/null
}
