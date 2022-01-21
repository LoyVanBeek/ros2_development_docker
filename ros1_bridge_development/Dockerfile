FROM loy:ros2foxy_ros1noetic

RUN apt update && apt install -yy -q \
  ros-foxy-example-interfaces \
  ros-foxy-action-tutorials-cpp \
  ros-noetic-actionlib-tutorials \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ros2/demos /root/ros2_ws/src/demos
WORKDIR /root/ros2_ws/src/demos
RUN git remote add ruffsl https://github.com/ruffsl/demos
RUN git fetch ruffsl
RUN git checkout ruffsl/master/bridge_action_tutorials_interfaces
