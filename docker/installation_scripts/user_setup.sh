#!/bin/bash
# This script is used to setup the user

set -Eeuo pipefail


adduser --disabled-password --gecos "" ${user_name}
usermod -aG sudo,video,dialout ${user_name}
echo "${user_name} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${user_name}
chmod 0440 /etc/sudoers.d/${user_name}
