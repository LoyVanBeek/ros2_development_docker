# ros2_development_docker
Dockerfiles to develop &amp; test ROS 2 stuff with.

Build image with

```bash
git clone git@github.com:LoyVanBeek/ros2_development_docker.git
cd ros2_development_docker
docker build -t loy:ros2_development .
docker build -t loy:ros2foxy_ros1noetic ros2foxy_ros1noetic/  # ROS 2 plus ROS 1
```