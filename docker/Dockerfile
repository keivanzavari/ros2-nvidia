FROM nvidia/cuda:12.2.0-devel-ubuntu22.04 as CUDA

ARG DEBIAN_FRONTEND=noninteractive
RUN  apt-get update && apt-get install -y  apt-utils wget curl sudo git tmux ipython3 && \
    rm -rf /var/lib/apt/lists/* 

ENV TZ=Etc/UTC
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
COPY installation_scripts/tz_setup.sh /tmp/
RUN /tmp/tz_setup.sh


ARG user_name
COPY installation_scripts/user_setup.sh /tmp/
RUN /tmp/user_setup.sh

USER ${user_name}
COPY configuration/.tmux.conf /home/${user_name}/

COPY installation_scripts/ros2_install.sh /tmp
RUN /tmp/ros2_install.sh

WORKDIR /home/${user_name}}
RUN mkdir -p ros_ws/src && cd ros_ws/src && \
    wget https://raw.githubusercontent.com/ros2/ros2/eloquent/ros2.repos && cd .. && \
    vcs import --input https://raw.githubusercontent.com/ros2/ros2/iron/ros2.repos src

