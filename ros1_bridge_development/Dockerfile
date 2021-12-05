FROM loy:ros2foxy_ros1noetic

RUN apt update && apt install -yy -q \
  ros-foxy-example-interfaces \
  ros-foxy-action-tutorials-cpp \
  ros-noetic-actionlib-tutorials \
  && rm -rf /var/lib/apt/lists/*

RUN git clone git@github.com:ros2/demos.git /root/ros2_ws/src/demos
RUN cd /root/ros2_ws/src/demos
RUN git remote add ruffsl git@github.com:ruffsl/demos.git
RUN git fetch ruffsl
RUN git checkout ruffsl/master/bridge_action_tutorials_interfaces