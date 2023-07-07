#!/bin/bash
# This script is used to install tmuxinator

# Not possible due to the sourcing of bashrc: set -Eeuo pipefail
# set -x

(
  # Dependencies
  sudo apt-get update
  sudo apt-get install -y make gcc build-essential \
    libssl-dev libreadline-dev zlib1g-dev autoconf bison libyaml-dev \
    libreadline-dev libncurses5-dev libffi-dev libgdbm-dev

  # Install rbenv
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$($HOME/.rbenv/bin/rbenv init -)"' >> ~/.bashrc
  source ~/.bashrc

  # Install ruby and tmuxinator
  $HOME/.rbenv/bin/rbenv install 3.0.5 -f
  $HOME/.rbenv/bin/rbenv global 3.0.5
  $HOME/.rbenv/shims/gem install tmuxinator

  sudo ln -s /home/${user_name}/.rbenv/shims/tmuxinator /usr/local/bin/tmuxinator
) >/dev/null
