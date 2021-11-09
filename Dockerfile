FROM ros:foxy-ros-core

# Set up ROS2

# RUN apt update && apt install -yy -q curl gnupg2 lsb-release && rm -rf /var/lib/apt/lists/*

# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && apt install -yy -q \
  apt-utils \
  build-essential \
  cmake \
  curl \
  git \
  ssh \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  vim \
  wget && rm -rf /var/lib/apt/lists/*

# install some pip packages needed for testing
RUN python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest

RUN apt update && apt install -yyq ros-foxy-ros-base && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/LoyVanBeek/tools.git /root/tools

COPY terminal_setup.sh /root/terminal_setup.sh
RUN echo "source /root/terminal_setup.sh" >> /root/.bashrc
COPY ros_utils.sh /root/ros_utils.sh
RUN echo "source /root/ros_utils.sh" >> /root/.bashrc
RUN echo "source /root/tools/bash_aliases.sh" >> /root/.bashrc
RUN echo "source /root/tools/git_terminal_setup.sh" >> /root/.bashrc

# RUN echo "source /opt/ros/foxy/setup.bash" | tee /root/.bashrc > /dev/null
# This alias comes from my `tools`
RUN echo "use-ros2" >> /root/.bashrc

## Set up ROS 2 workspace
WORKDIR /root/ros2_ws/src
WORKDIR /root/ros2_ws

RUN colcon build --event-handlers console_direct+ status-