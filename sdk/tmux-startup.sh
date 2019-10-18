#!/bin/bash

. /home/build/sdk/startup.sh

tmux -L $1 new-session -n openwrt-sdk /bin/bash