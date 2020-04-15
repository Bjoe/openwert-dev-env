#!/bin/bash

if [ -x /home/build/sdk/additional-settings.sh ]; then
    /home/build/sdk/additional-settings.sh
fi

export PATH=$PATH

tmux -S /var/tmp/$1 new-session -n $1 /bin/bash