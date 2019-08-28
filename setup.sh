#!/bin/bash

# Idempotent add line func
add_line() {
    # usage: add_line <line> <file>
    grep -qF "$1" "$2" || echo "$1" >> "$2"
}

# Source: https://jekyllrb.com/docs/installation/ubuntu/

# install Ruby
sudo apt-get install ruby-full build-essential zlib1g-dev

# set .bashrc
add_line '# Install Ruby Gems to ~/gems' $HOME/.bashrc
add_line 'export GEM_HOME="$HOME/gems"' $HOME/.bashrc
add_line 'export PATH="$HOME/gems/bin:$PATH"' $HOME/.bashrc
source ~/.bashrc

# install Jekyll
sudo gem install jekyll bundler