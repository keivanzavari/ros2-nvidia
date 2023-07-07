#!/bin/bash
# This script is used to set the timezone for the container

set -Eeuo pipefail
# set -x

(
    apt-get update -y

    # Install locales and configure UTF-8 charset
    apt-get install locales -y
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale
    dpkg-reconfigure --frontend=noninteractive locales
    update-locale LANG=en_US.UTF-8

    # Install tzdata so python3 does not ask for timezone
    DEBIAN_FRONTEND=${DEBIAN_FRONTEND} TZ=${TZ} apt-get install -y tzdata apt-utils
) >/dev/null
