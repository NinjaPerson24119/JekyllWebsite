#!/bin/bash

# Idempotent add line func
add_line() {
    # usage: add_line <line> <file>
    grep -qF "$1" "$2" || echo "$1" >> "$2"
}

# Sources:
# - 
# - 
# Install rbenv and specific Ruby version
# https://github.com/rbenv/rbenv#basic-git-checkout
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
rbenv install 2.7.8

cd www
gem update --system

# install Jekyll deps
# https://jekyllrb.com/docs/installation/ubuntu/
sudo apt-get install build-essential zlib1g-dev
sudo gem install jekyll bundler
