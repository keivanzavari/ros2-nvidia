#!/usr/bin/env bash

docker build -t ros2-nvidia . --build-arg user_name=$LOGNAME
